#!/bin/bash

nvcc matmul_cuda_128.cu -o matmul_cuda_128.o
nvcc matmul_cuda_256.cu -o matmul_cuda_256.o
nvcc matmul_cuda_512.cu -o matmul_cuda_512.o
nvcc matmul_cuda_1024.cu -o matmul_cuda_1024.o
nvcc matmul_cuda_2048.cu -o matmul_cuda_2048.o
nvcc matmul_cuda_4096.cu -o matmul_cuda_4096.o
nvcc matmul_cuda_8192.cu -o matmul_cuda_8192.o

./matmul_cuda_128.o > matmul_cuda_128.out
./matmul_cuda_256.o > matmul_cuda_256.out
./matmul_cuda_512.o > matmul_cuda_512.out
./matmul_cuda_1024.o > matmul_cuda_1024.out
./matmul_cuda_2048.o > matmul_cuda_2048.out
./matmul_cuda_4096.o > matmul_cuda_4096.out
./matmul_cuda_8192.o > matmul_cuda_8192.out
