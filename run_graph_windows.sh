#!/bin/bash
mpicc mpi_graph_create.c -o mpi_graph_create.o
time mpirun --hostfile yoga-windows-hosts -np 4 mpi_graph_create.o > mpi_graph_create.out