#!/bin/bash
#SBATCH -o mpi_cart_create.out
#SBATCH -p batch
#SBATCH -N 8
#SBATCH --nodelist=node-01,node-02,node-03,node-04,node-05,node-06,node-07,node-08

time mpirun --hostfile cluster-fasilkom-hosts -np 12 mpi_cart_create.o --mca btl_tcp_if_exclude docker0,lo 