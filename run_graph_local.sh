#!/bin/bash
mpicc mpi_graph_create.c -o mpi_graph_create.o
time mpirun --hostfile yoga-hosts mpi_graph_create.o