#!/bin/bash
#SBATCH -p batch
#SBATCH -N 8
#SBATCH --nodelist=node-01,node-02,node-03,node-04,node-05,node-06,node-07,node-08

{ time mpirun --hostfile cluster-fasilkom-hosts -np 64 matmul_2048.o > matmul_2048_n64.out ; } 2> matmul_2048_n64.time