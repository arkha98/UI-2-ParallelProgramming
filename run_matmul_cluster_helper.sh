#!/bin/bash
#SBATCH -o matmul.out
#SBATCH -p batch
#SBATCH -N 8
#SBATCH --nodelist=node-01,node-02,node-03,node-04,node-05,node-06,node-07,node-08

time mpirun --hostfile cluster-fasilkom-hosts -np 64 matmul.o --mca btl_tcp_if_exclude docker0,lo