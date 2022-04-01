#!/bin/bash

mpicc matmul_128.c -o matmul_128.o
mpicc matmul_256.c -o matmul_256.o
mpicc matmul_512.c -o matmul_512.o
mpicc matmul_1024.c -o matmul_1024.o
mpicc matmul_2048.c -o matmul_2048.o
mpicc matmul_4096.c -o matmul_4096.o
mpicc matmul_8192.c -o matmul_8192.o

{ time mpirun --hostfile google-hosts -np 1 matmul_128.o > matmul_128_n1.out ; } 2> matmul_128_n1.time
{ time mpirun --hostfile google-hosts -np 1 matmul_256.o > matmul_256_n1.out ; } 2> matmul_256_n1.time
{ time mpirun --hostfile google-hosts -np 1 matmul_512.o > matmul_512_n1.out ; } 2> matmul_512_n1.time
{ time mpirun --hostfile google-hosts -np 1 matmul_1024.o > matmul_1024_n1.out ; } 2> matmul_1024_n1.time
{ time mpirun --hostfile google-hosts -np 1 matmul_2048.o > matmul_2048_n1.out ; } 2> matmul_2048_n1.time
{ time mpirun --hostfile google-hosts -np 1 matmul_4096.o > matmul_4096_n1.out ; } 2> matmul_4096_n1.time
{ time mpirun --hostfile google-hosts -np 1 matmul_8192.o > matmul_8192_n1.out ; } 2> matmul_8192_n1.time

{ time mpirun --hostfile google-hosts -np 2 matmul_128.o > matmul_128_n2.out ; } 2> matmul_128_n2.time
{ time mpirun --hostfile google-hosts -np 2 matmul_256.o > matmul_256_n2.out ; } 2> matmul_256_n2.time
{ time mpirun --hostfile google-hosts -np 2 matmul_512.o > matmul_512_n2.out ; } 2> matmul_512_n2.time
{ time mpirun --hostfile google-hosts -np 2 matmul_1024.o > matmul_1024_n2.out ; } 2> matmul_1024_n2.time
{ time mpirun --hostfile google-hosts -np 2 matmul_2048.o > matmul_2048_n2.out ; } 2> matmul_2048_n2.time
{ time mpirun --hostfile google-hosts -np 2 matmul_4096.o > matmul_4096_n2.out ; } 2> matmul_4096_n2.time
{ time mpirun --hostfile google-hosts -np 2 matmul_8192.o > matmul_8192_n2.out ; } 2> matmul_8192_n2.time