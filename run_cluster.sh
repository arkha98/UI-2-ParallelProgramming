#!/bin/sh
#SBATCH -p greeting.out
#SBATCH -p batch
#SBATCH -N 3
#SBATCH --nodelist=node-01,node-03,node-05
mpicc greeting.c -o greeting.o
time mpirun --hostfile cluster-fasilkom-hosts -np 10 /home/user20/UI-2-ParallelProgramming/greeting.o --use-hwthread-cpus 8 --mca btl_tcp_if_exclude docker0,lo