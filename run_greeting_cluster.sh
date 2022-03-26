#!/bin/bash
mpicc greeting.c -o greeting.o
sbatch run_greeting_cluster_helper.sh