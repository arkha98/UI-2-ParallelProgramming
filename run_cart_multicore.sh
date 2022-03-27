#!/bin/bash
mpicc mpi_cart_create.c -o mpi_cart_create.o
time mpirun --hostfile multicore-hosts -np 12 mpi_cart_create.o > mpi_cart_create.out