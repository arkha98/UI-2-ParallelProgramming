#!/bin/bash
#SBATCH -o mpi_graph_create.out
mpicc mpi_graph_create.c -o mpi_graph_create.o
time mpirun --hostfile yoga-thinkpad-hosts -np 4 mpi_graph_create.o --mca opal_warn_on_missing_libcuda 0 > mpi_graph_create.out