#!/bin/bash
mpicc matmul.c -o matmul.o
time mpirun --hostfile yoga-windows-hosts -np 8 matmul.o > matmul.out