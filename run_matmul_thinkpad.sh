#!/bin/bash

mpicc matmul_128.c -o matmul_128.o
mpicc matmul_256.c -o matmul_256.o
mpicc matmul_512.c -o matmul_512.o
mpicc matmul_1024.c -o matmul_1024.o
mpicc matmul_2048.c -o matmul_2048.o
mpicc matmul_4096.c -o matmul_4096.o
mpicc matmul_8192.c -o matmul_8192.o

{ time mpirun --hostfile yoga-thinkpad-hosts -np 2 matmul_128_n2.o --mca opal_warn_on_missing_libcuda 0 > matmul_128_n2.out ; } 2> matmul_128_n2.time
{ time mpirun --hostfile yoga-thinkpad-hosts -np 2 matmul_256_n2.o --mca opal_warn_on_missing_libcuda 0 > matmul_256_n2.out ; } 2> matmul_256_n2.time
{ time mpirun --hostfile yoga-thinkpad-hosts -np 2 matmul_512_n2.o --mca opal_warn_on_missing_libcuda 0 > matmul_512_n2.out ; } 2> matmul_512_n2.time
{ time mpirun --hostfile yoga-thinkpad-hosts -np 2 matmul_1024_n2.o --mca opal_warn_on_missing_libcuda 0 > matmul_1024_n2.out ; } 2> matmul_1024_n2.time
{ time mpirun --hostfile yoga-thinkpad-hosts -np 2 matmul_2048_n2.o --mca opal_warn_on_missing_libcuda 0 > matmul_2048_n2.out ; } 2> matmul_2048_n2.time
{ time mpirun --hostfile yoga-thinkpad-hosts -np 2 matmul_4096_n2.o --mca opal_warn_on_missing_libcuda 0 > matmul_4096_n2.out ; } 2> matmul_4096_n2.time
{ time mpirun --hostfile yoga-thinkpad-hosts -np 2 matmul_8192_n2.o --mca opal_warn_on_missing_libcuda 0 > matmul_8192_n2.out ; } 2> matmul_8192_n2.time

{ time mpirun --hostfile yoga-thinkpad-hosts -np 4 matmul_128_n4.o --mca opal_warn_on_missing_libcuda 0 > matmul_128_n4.out ; } 2> matmul_128_n4.time
{ time mpirun --hostfile yoga-thinkpad-hosts -np 4 matmul_256_n4.o --mca opal_warn_on_missing_libcuda 0 > matmul_256_n4.out ; } 2> matmul_256_n4.time
{ time mpirun --hostfile yoga-thinkpad-hosts -np 4 matmul_512_n4.o --mca opal_warn_on_missing_libcuda 0 > matmul_512_n4.out ; } 2> matmul_512_n4.time
{ time mpirun --hostfile yoga-thinkpad-hosts -np 4 matmul_1024_n4.o --mca opal_warn_on_missing_libcuda 0 > matmul_1024_n4.out ; } 2> matmul_1024_n4.time
{ time mpirun --hostfile yoga-thinkpad-hosts -np 4 matmul_2048_n4.o --mca opal_warn_on_missing_libcuda 0 > matmul_2048_n4.out ; } 2> matmul_2048_n4.time
{ time mpirun --hostfile yoga-thinkpad-hosts -np 4 matmul_4096_n4.o --mca opal_warn_on_missing_libcuda 0 > matmul_4096_n4.out ; } 2> matmul_4096_n4.time
{ time mpirun --hostfile yoga-thinkpad-hosts -np 4 matmul_8192_n4.o --mca opal_warn_on_missing_libcuda 0 > matmul_8192_n4.out ; } 2> matmul_8192_n4.time