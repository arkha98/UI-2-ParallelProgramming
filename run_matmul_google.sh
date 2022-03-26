#!/bin/bash
mpicc matmul.c -o matmul.o
time mpirun --hostfile google-hosts -np 1 matmul.o > matmul.out