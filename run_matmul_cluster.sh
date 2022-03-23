#!/bin/bash
#SBATCH -p batch
#SBATCH -N 3
#SBATCH --nodelist=node-01,node-02

time mpirun --hostfile cluster-fasilkom-hosts --mca btl_tcp_if_exclude docker0,lo -np 4 /home/user20/UI-2-ParallelProgramming/matmul.o