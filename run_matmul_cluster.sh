#!/bin/bash
mpicc matmul.c -o matmul.o
sbatch run_matmul_cluster_helper.sh