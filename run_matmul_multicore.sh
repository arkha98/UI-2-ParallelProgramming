#!/bin/bash
mpicc matmul.c -o matmul.o
time mpirun --hostfile multicore-hosts -np 64 matmul.o