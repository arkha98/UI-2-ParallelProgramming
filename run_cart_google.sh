#!/bin/bash
mpicc mpi_cart_create.c -o mpi_cart_create.o
time mpirun --hostfile google-hosts -np 1 mpi_cart_create.o > mpi_cart_create.out