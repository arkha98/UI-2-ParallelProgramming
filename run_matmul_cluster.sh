#!/bin/bash

mpicc matmul_128.c -o matmul_128.o
mpicc matmul_256.c -o matmul_256.o
mpicc matmul_512.c -o matmul_512.o
mpicc matmul_1024.c -o matmul_1024.o
mpicc matmul_2048.c -o matmul_2048.o
mpicc matmul_4096.c -o matmul_4096.o
mpicc matmul_8192.c -o matmul_8192.o

sbatch /home/user20/UI-2-ParallelProgramming/run_matmul_cluster_helper.sh