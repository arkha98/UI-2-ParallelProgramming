#!/bin/bash
mpicc matmul.c -o matmul.o
time mpirun --hostfile google-hosts -np 4 matmul.o > matmul.out