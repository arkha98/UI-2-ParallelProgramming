#!/bin/bash
#SBATCH -o matmul.out
mpicc matmul.c -o matmul.o
time mpirun --hostfile yoga-thinkpad-hosts -np 4 matmul.o --mca opal_warn_on_missing_libcuda 0 > matmul.out