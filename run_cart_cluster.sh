#!/bin/bash
mpicc mpi_cart_create.c -o mpi_cart_create.o
sbatch run_cart_cluster_helper.sh