#!/bin/bash
#SBATCH -o greeting.out
mpicc greeting.c -o greeting.o
time mpirun --hostfile multicore-hosts -np 64 greeting.o