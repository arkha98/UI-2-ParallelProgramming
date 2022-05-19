#include <stdio.h>
#include <assert.h>
#include <cuda.h>

void incrementArrayOnHost(float *a, int N)
{
    int i;
    for (i=0; i < N; i++) a[i] = a[i]+1.f;
}

__global__ void incrementArrayOnDevice(float *a, int N)
{
    int idx = blockIdx.x*blockDim.x + threadIdx.x;
    if (idx<N) a[idx] = a[idx]+1.f;
}

__global__ void kernel_a (int *a)
{
    int idx = blockIdx.x*blockDim.x + threadIdx.x;
    a[idx] = 7;
}

__global__ void kernel_b (int *a)
{
    int idx = blockIdx.x*blockDim.x + threadIdx.x;
    a[idx] = 7;
}

__global__ void kernel_c (int *a)
{
    int idx = blockIdx.x*blockDim.x + threadIdx.x;
    a[idx] = 7;
}

int main(void)
{
    float *a_h, *b_h, *k_a, *k_b, *k_c; // pointers to host memory
    float *a_d; // pointer to device memory
    int i, N = 10;
    size_t size = N*sizeof(float);
    // allocate arrays on host
    a_h = (float *)malloc(size);
    b_h = (float *)malloc(size);
    k_a = (float *)malloc(size);
    k_b = (float *)malloc(size);
    k_c = (float *)malloc(size);
    // allocate array on device
    cudaMalloc((void **) &a_d, size);
    // initialization of host data
    for (i=0; i<N; i++) a_h[i] = (float)i;
    // copy data from host to device
    cudaMemcpy(a_d, a_h, sizeof(float)*N, cudaMemcpyHostToDevice);
    // do calculation on host
    printf("HOST\n");
    printf("increment array on host\n");
    incrementArrayOnHost(a_h, N);
    printf("calculate modified kernel");
    kernel_a(k_a, N);
    kernel_a(k_b, N);
    kernel_a(k_c, N);
    // do calculation on device:
    printf("DEVICE\n");
    // Part 1 of 2. Compute execution configuration
    printf("compute execution configuration\n");
    int blockSize = 4;
    int nBlocks = N/blockSize + (N%blockSize == 0?0:1);
    // Part 2 of 2. Call incrementArrayOnDevice kernel
    printf("increment array on device\n");
    incrementArrayOnDevice <<< nBlocks, blockSize >>> (a_d, N);
    // Retrieve result from device and store in b_h
    cudaMemcpy(b_h, a_d, sizeof(float)*N, cudaMemcpyDeviceToHost);
    // check results
    printf("HOSTS\tDEVICE\tKERNEL_a\tKERNEL_b\tKERNEL_c\n");
    for (i=0; i<N; i++)
    {
        printf("%.0f\t%.0f\t%.0f\t%.0f\t%.0f\n", a_h[i], b_h[i], k_a[i], k_b[i], k_c[i]);
        // assert(a_h[i] == b_h[i]);
    }
    // printf("passing assert so its valid!!!\n");
    // cleanup
    free(a_h); free(b_h); cudaFree(a_d);
}