#!/bin/bash
#SBATCH -p batch
#SBATCH -N 8
#SBATCH --nodelist=node-01,node-02,node-03,node-04,node-05,node-06,node-07,node-08

{ time mpirun --hostfile cluster-hosts -np 16 /home/user20/UI-2-ParallelProgramming/matmul_128.o > /home/user20/UI-2-ParallelProgramming/matmul_128_n16.out ; } 2> /home/user20/UI-2-ParallelProgramming/matmul_128_n16.time
{ time mpirun --hostfile cluster-hosts -np 16 /home/user20/UI-2-ParallelProgramming/matmul_256.o > /home/user20/UI-2-ParallelProgramming/matmul_256_n16.out ; } 2> /home/user20/UI-2-ParallelProgramming/matmul_256_n16.time
{ time mpirun --hostfile cluster-hosts -np 16 /home/user20/UI-2-ParallelProgramming/matmul_512.o > /home/user20/UI-2-ParallelProgramming/matmul_512_n16.out ; } 2> /home/user20/UI-2-ParallelProgramming/matmul_512_n16.time
{ time mpirun --hostfile cluster-hosts -np 16 /home/user20/UI-2-ParallelProgramming/matmul_1024.o > /home/user20/UI-2-ParallelProgramming/matmul_1024_n16.out ; } 2> /home/user20/UI-2-ParallelProgramming/matmul_1024_n16.time
{ time mpirun --hostfile cluster-hosts -np 16 /home/user20/UI-2-ParallelProgramming/matmul_2048.o > /home/user20/UI-2-ParallelProgramming/matmul_2048_n16.out ; } 2> /home/user20/UI-2-ParallelProgramming/matmul_2048_n16.time
{ time mpirun --hostfile cluster-hosts -np 16 /home/user20/UI-2-ParallelProgramming/matmul_4096.o > /home/user20/UI-2-ParallelProgramming/matmul_4096_n16.out ; } 2> /home/user20/UI-2-ParallelProgramming/matmul_4096_n16.time
{ time mpirun --hostfile cluster-hosts -np 16 /home/user20/UI-2-ParallelProgramming/matmul_8192.o > /home/user20/UI-2-ParallelProgramming/matmul_8192_n16.out ; } 2> /home/user20/UI-2-ParallelProgramming/matmul_8192_n16.time

{ time mpirun --hostfile cluster-hosts -np 32 /home/user20/UI-2-ParallelProgramming/matmul_128.o > /home/user20/UI-2-ParallelProgramming/matmul_128_n32.out ; } 2> /home/user20/UI-2-ParallelProgramming/matmul_128_n32.time
{ time mpirun --hostfile cluster-hosts -np 32 /home/user20/UI-2-ParallelProgramming/matmul_256.o > /home/user20/UI-2-ParallelProgramming/matmul_256_n32.out ; } 2> /home/user20/UI-2-ParallelProgramming/matmul_256_n32.time
{ time mpirun --hostfile cluster-hosts -np 32 /home/user20/UI-2-ParallelProgramming/matmul_512.o > /home/user20/UI-2-ParallelProgramming/matmul_512_n32.out ; } 2> /home/user20/UI-2-ParallelProgramming/matmul_512_n32.time
{ time mpirun --hostfile cluster-hosts -np 32 /home/user20/UI-2-ParallelProgramming/matmul_1024.o > /home/user20/UI-2-ParallelProgramming/matmul_1024_n32.out ; } 2> /home/user20/UI-2-ParallelProgramming/matmul_1024_n32.time
{ time mpirun --hostfile cluster-hosts -np 32 /home/user20/UI-2-ParallelProgramming/matmul_2048.o > /home/user20/UI-2-ParallelProgramming/matmul_2048_n32.out ; } 2> /home/user20/UI-2-ParallelProgramming/matmul_2048_n32.time
{ time mpirun --hostfile cluster-hosts -np 32 /home/user20/UI-2-ParallelProgramming/matmul_4096.o > /home/user20/UI-2-ParallelProgramming/matmul_4096_n32.out ; } 2> /home/user20/UI-2-ParallelProgramming/matmul_4096_n32.time
{ time mpirun --hostfile cluster-hosts -np 32 /home/user20/UI-2-ParallelProgramming/matmul_8192.o > /home/user20/UI-2-ParallelProgramming/matmul_8192_n32.out ; } 2> /home/user20/UI-2-ParallelProgramming/matmul_8192_n32.time

{ time mpirun --hostfile cluster-hosts -np 64 /home/user20/UI-2-ParallelProgramming/matmul_128.o > /home/user20/UI-2-ParallelProgramming/matmul_128_n64.out ; } 2> /home/user20/UI-2-ParallelProgramming/matmul_128_n64.time
{ time mpirun --hostfile cluster-hosts -np 64 /home/user20/UI-2-ParallelProgramming/matmul_256.o > /home/user20/UI-2-ParallelProgramming/matmul_256_n64.out ; } 2> /home/user20/UI-2-ParallelProgramming/matmul_256_n64.time
{ time mpirun --hostfile cluster-hosts -np 64 /home/user20/UI-2-ParallelProgramming/matmul_512.o > /home/user20/UI-2-ParallelProgramming/matmul_512_n64.out ; } 2> /home/user20/UI-2-ParallelProgramming/matmul_512_n64.time
{ time mpirun --hostfile cluster-hosts -np 64 /home/user20/UI-2-ParallelProgramming/matmul_1024.o > /home/user20/UI-2-ParallelProgramming/matmul_1024_n64.out ; } 2> /home/user20/UI-2-ParallelProgramming/matmul_1024_n64.time
{ time mpirun --hostfile cluster-hosts -np 64 /home/user20/UI-2-ParallelProgramming/matmul_2048.o > /home/user20/UI-2-ParallelProgramming/matmul_2048_n64.out ; } 2> /home/user20/UI-2-ParallelProgramming/matmul_2048_n64.time
{ time mpirun --hostfile cluster-hosts -np 64 /home/user20/UI-2-ParallelProgramming/matmul_4096.o > /home/user20/UI-2-ParallelProgramming/matmul_4096_n64.out ; } 2> /home/user20/UI-2-ParallelProgramming/matmul_4096_n64.time
{ time mpirun --hostfile cluster-hosts -np 64 /home/user20/UI-2-ParallelProgramming/matmul_8192.o > /home/user20/UI-2-ParallelProgramming/matmul_8192_n64.out ; } 2> /home/user20/UI-2-ParallelProgramming/matmul_8192_n64.time