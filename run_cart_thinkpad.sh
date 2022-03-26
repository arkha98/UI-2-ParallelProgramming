#!/bin/bash
mpicc mpi_cart_create.c -o mpi_cart_create.o
time mpirun --hostfile yoga-thinkpad-hosts -np 4 mpi_cart_create.o --mca opal_warn_on_missing_libcuda 0 > mpi_cart_create.out