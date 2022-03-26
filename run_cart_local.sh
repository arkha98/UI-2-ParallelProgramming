#!/bin/bash
mpicc mpi_cart_create.c -o mpi_cart_create.o
time mpirun --hostfile yoga-hosts mpi_cart_create.o