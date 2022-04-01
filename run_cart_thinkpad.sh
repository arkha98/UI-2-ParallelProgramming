#!/bin/bash
#SBATCH -o mpi_cart_create.out
mpicc mpi_cart_create.c -o mpi_cart_create.o
time mpirun --hostfile yoga-thinkpad-hosts -np 12 mpi_cart_create.o --mca opal_warn_on_missing_libcuda 0 > mpi_cart_create.out