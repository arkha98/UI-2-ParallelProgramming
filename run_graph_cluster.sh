#!/bin/bash
mpicc mpi_graph_create.c -o mpi_graph_create.o
sbatch run_graph_cluster_helper.sh