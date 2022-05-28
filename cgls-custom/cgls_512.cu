#include <stdlib.h>
#include <time.h>
#include <cmath>

#include "cgls.cuh"

// Define real type.
typedef double real_t;
typedef cuDoubleComplex complex_t;
#define csr2csc cusparseDcsr2csc
#define makeComplex make_cuDoubleComplex
// #define csr2csc cusparseScsr2csc
// typedef float real_t;
// typedef cuFloatComplex complex_t;
// #define makeComplex make_cuFloatComplex

// Generates random CSR matrix with entries in [-1, 1]. The matrix will have
// exactly nnz non-zeros. All arrays must be pre-allocated.
void CsrMatGen(int m, int n, int nnz, real_t *val, int *rptr, int *cind) {
  real_t kRandMax = static_cast<real_t>(RAND_MAX);
  real_t kM = static_cast<real_t>(m);
  real_t kN = static_cast<real_t>(n);

  int num = 0;
  for (int i = 0; i < m; ++i) {
    rptr[i] = num;
    for (int j = 0; j < n && num < nnz; ++j) {
      if (rand() / kRandMax * ((kM - i) * kN - j) < (nnz - num)) {
        val[num] = 2 * (rand() - kRandMax / 2) / kRandMax;
        cind[num] = j;
        num++;
      }
    }
  }
  rptr[m] = nnz;
}

// Test CGLS on larger random matrix.
void test() {
  // Reset random seed.
  srand(0);

  // Initialize variables.
  real_t shift = 1;
  real_t tol = 1e-6;
  int maxit = 30;
  bool quiet = false;
  int m = 512;
  int n = 512;
  int nnz = 262144;

  printf("M = %d\n", m);
  printf("N = %d\n", n);

  // Initialize data.
  real_t *val_h = new real_t[nnz];
  int *cind_h = new int[nnz];
  int *rptr_h = new int[m + 1];
  real_t *b_h = new real_t[m];
  real_t *x1_h = new real_t[n]();
  real_t *x2_h = new real_t[n]();
  real_t *x3_h = new real_t[n]();
  real_t *x4_h = new real_t[n]();

  // Generate data.
  CsrMatGen(m, n, nnz, val_h, rptr_h, cind_h);
  for (int i = 0; i < m; ++i)
    b_h[i] = rand() / static_cast<real_t>(RAND_MAX);

  // Allocate x and b
  real_t *b_d, *x1_d, *x2_d, *x3_d, *x4_d;
  cudaMalloc(&x1_d, n * sizeof(real_t));
  cudaMalloc(&x2_d, n * sizeof(real_t));
  cudaMalloc(&x3_d, n * sizeof(real_t));
  cudaMalloc(&x4_d, n * sizeof(real_t));
  cudaMalloc(&b_d, m * sizeof(real_t));

  // Allocate A
  real_t *val_a_d;
  int *cind_a_d, *rptr_a_d;
  cudaMalloc(&val_a_d, nnz * sizeof(real_t));
  cudaMalloc(&cind_a_d, nnz * sizeof(int));
  cudaMalloc(&rptr_a_d, (m + 1) * sizeof(int));

  // Allocate A^T
  real_t *val_at_d;
  int *cind_at_d, *rptr_at_d;
  cudaMalloc(&val_at_d, nnz * sizeof(real_t));
  cudaMalloc(&cind_at_d, nnz * sizeof(int));
  cudaMalloc(&rptr_at_d, (n + 1) * sizeof(int));

  // Transfer all data to device.
  cudaMemcpy(b_d, b_h, m * sizeof(real_t), cudaMemcpyHostToDevice);
  cudaMemcpy(x1_d, x1_h, n * sizeof(real_t), cudaMemcpyHostToDevice);
  cudaMemcpy(x2_d, x2_h, n * sizeof(real_t), cudaMemcpyHostToDevice);
  cudaMemcpy(x3_d, x3_h, n * sizeof(real_t), cudaMemcpyHostToDevice);
  cudaMemcpy(x4_d, x4_h, n * sizeof(real_t), cudaMemcpyHostToDevice);
  cudaMemcpy(val_a_d, val_h, nnz * sizeof(real_t), cudaMemcpyHostToDevice);
  cudaMemcpy(cind_a_d, cind_h, nnz * sizeof(int), cudaMemcpyHostToDevice);
  cudaMemcpy(rptr_a_d, rptr_h, (m + 1) * sizeof(int), cudaMemcpyHostToDevice);

  // Make A^T copy.
  cusparseHandle_t handle_s;
  cusparseCreate(&handle_s);
  csr2csc(handle_s, m, n, nnz, val_a_d, rptr_a_d, cind_a_d, val_at_d,
      cind_at_d, rptr_at_d, CUSPARSE_ACTION_NUMERIC,
      CUSPARSE_INDEX_BASE_ZERO);
  cudaDeviceSynchronize();
  cusparseDestroy(handle_s);

  // Execution time
  clock_t t_start = clock();

  // Solve with only A.
  int flag1 = cgls::Solve<real_t, cgls::CSR>(val_a_d, rptr_a_d, cind_a_d,
      m, n, nnz, b_d, x1_d, shift, tol, maxit, quiet);
  int flag2 = cgls::Solve<real_t, cgls::CSC>(val_at_d, rptr_at_d, cind_at_d,
      m, n, nnz, b_d, x2_d, shift, tol, maxit, quiet);

  // Solve with A and A^T.
  int flag3 = cgls::Solve<real_t, cgls::CSR>(val_a_d, rptr_a_d, cind_a_d,
      val_at_d, rptr_at_d, cind_at_d, m, n, nnz, b_d, x3_d, shift, tol, maxit,
      quiet);
  int flag4 = cgls::Solve<real_t, cgls::CSC>(val_at_d, rptr_at_d, cind_at_d,
      val_a_d, rptr_a_d, cind_a_d, m, n, nnz, b_d, x4_d, shift, tol, maxit,
      quiet);
  
  // Execution time
  clock_t t_end = clock();
  double t = (double)(t_end-t_start) / (CLOCKS_PER_SEC/1000);

  // Retrieve solution.
  cudaMemcpy(x1_h, x1_d, n * sizeof(real_t), cudaMemcpyDeviceToHost);
  cudaMemcpy(x2_h, x2_d, n * sizeof(real_t), cudaMemcpyDeviceToHost);
  cudaMemcpy(x3_h, x3_d, n * sizeof(real_t), cudaMemcpyDeviceToHost);
  cudaMemcpy(x4_h, x4_d, n * sizeof(real_t), cudaMemcpyDeviceToHost);

  // Compute error and print.
  real_t err1 = 0, err2 = 0, err3 = 0;
  for (int i = 0; i < n; ++i)
    err1 += (x1_h[i] - x2_h[i]) * (x1_h[i] - x2_h[i]);
  err1 = std::sqrt(err1);
  for (int i = 0; i < n; ++i)
    err2 += (x1_h[i] - x3_h[i]) * (x1_h[i] - x3_h[i]);
  err2 = std::sqrt(err2);
  for (int i = 0; i < n; ++i)
    err3 += (x1_h[i] - x4_h[i]) * (x1_h[i] - x4_h[i]);
  err3 = std::sqrt(err3);

  if (flag1 == 0 && flag2 == 0 && flag3 == 0 && flag4 == 0
      && err1 < tol && err2 < tol && err3 < tol) {
    printf("Test Passed: Flag = (%d, %d, %d, %d), Error = (%e, %e, %e)\n",
        flag1, flag2, flag3, flag4, err1, err2, err3);
  } else {
    printf("Test Failed: Flag = (%d, %d, %d, %d), Error = (%e, %e, %e)\n",
        flag1, flag2, flag3, flag4, err1, err2, err3);
  }
  printf("Execution time (milliseconds) = %f\n", t);

  // Free data.
  cudaFree(b_d);
  cudaFree(x1_d);
  cudaFree(x2_d);
  cudaFree(x3_d);
  cudaFree(x4_d);

  cudaFree(val_a_d);
  cudaFree(cind_a_d);
  cudaFree(rptr_a_d);

  cudaFree(val_at_d);
  cudaFree(cind_at_d);
  cudaFree(rptr_at_d);

  delete [] val_h;
  delete [] rptr_h;
  delete [] cind_h;
  delete [] x1_h;
  delete [] x2_h;
  delete [] b_h;
}

// Run tests.
int main() {
  // Run test
  test();
}

