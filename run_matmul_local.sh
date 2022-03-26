#!/bin/bash
mpicc matmul.c -o matmul.o
time mpirun --hostfile yoga-hosts -np 8 matmul.o