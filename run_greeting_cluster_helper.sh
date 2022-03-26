#!/bin/bash
#SBATCH -o greeting.out
#SBATCH -p batch
#SBATCH -N 3
#SBATCH --nodelist=node-01,node-03,node-05

time mpirun --mca btl_tcp_if_exclude docker0,lo -np 10 greeting.o