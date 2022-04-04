#!/bin/bash
#SBATCH -p batch
#SBATCH -N 8
#SBATCH --nodelist=node-01,node-02,node-03,node-04,node-05,node-06,node-07,node-08

{ time mpirun --hostfile cluster-hosts -np 12 /home/user20/UI-2-ParallelProgramming/mpi_cart_create.o --mca btl_tcp_if_exclude docker0,lo > /home/user20/UI-2-ParallelProgramming/mpi_cart_create.out ; } 2> /home/user20/UI-2-ParallelProgramming/mpi_cart_create.time