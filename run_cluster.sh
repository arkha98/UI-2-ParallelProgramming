#!/bin/sh
#SBATCH -o greeting.out
#SBATCH -p batch
#SBATCH -N 4
#SBATCH -nodelist=node-01,node-03,node-05

mpirun -np 10 greeting.o