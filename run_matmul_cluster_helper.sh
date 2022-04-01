#!/bin/bash
#SBATCH -p batch
#SBATCH -N 8
#SBATCH --nodelist=node-01,node-02,node-03,node-04,node-05,node-06,node-07,node-08

{ time mpirun --hostfile cluster-fasilkom-hosts -np 2 matmul_128_n2.o > matmul_128_n2.out ; } 2> matmul_128_n2.time
{ time mpirun --hostfile cluster-fasilkom-hosts -np 2 matmul_256_n2.o > matmul_256_n2.out ; } 2> matmul_256_n2.time
{ time mpirun --hostfile cluster-fasilkom-hosts -np 2 matmul_512_n2.o > matmul_512_n2.out ; } 2> matmul_512_n2.time
{ time mpirun --hostfile cluster-fasilkom-hosts -np 2 matmul_1024_n2.o > matmul_1024_n2.out ; } 2> matmul_1024_n2.time
{ time mpirun --hostfile cluster-fasilkom-hosts -np 2 matmul_2048_n2.o > matmul_2048_n2.out ; } 2> matmul_2048_n2.time
{ time mpirun --hostfile cluster-fasilkom-hosts -np 2 matmul_4096_n2.o > matmul_4096_n2.out ; } 2> matmul_4096_n2.time
{ time mpirun --hostfile cluster-fasilkom-hosts -np 2 matmul_8192_n2.o > matmul_8192_n2.out ; } 2> matmul_8192_n2.time

{ time mpirun --hostfile cluster-fasilkom-hosts -np 4 matmul_128_n4.o > matmul_128_n4.out ; } 2> matmul_128_n4.time
{ time mpirun --hostfile cluster-fasilkom-hosts -np 4 matmul_256_n4.o > matmul_256_n4.out ; } 2> matmul_256_n4.time
{ time mpirun --hostfile cluster-fasilkom-hosts -np 4 matmul_512_n4.o > matmul_512_n4.out ; } 2> matmul_512_n4.time
{ time mpirun --hostfile cluster-fasilkom-hosts -np 4 matmul_1024_n4.o > matmul_1024_n4.out ; } 2> matmul_1024_n4.time
{ time mpirun --hostfile cluster-fasilkom-hosts -np 4 matmul_2048_n4.o > matmul_2048_n4.out ; } 2> matmul_2048_n4.time
{ time mpirun --hostfile cluster-fasilkom-hosts -np 4 matmul_4096_n4.o > matmul_4096_n4.out ; } 2> matmul_4096_n4.time
{ time mpirun --hostfile cluster-fasilkom-hosts -np 4 matmul_8192_n4.o > matmul_8192_n4.out ; } 2> matmul_8192_n4.time

{ time mpirun --hostfile cluster-fasilkom-hosts -np 8 matmul_128_n8.o > matmul_128_n8.out ; } 2> matmul_128_n8.time
{ time mpirun --hostfile cluster-fasilkom-hosts -np 8 matmul_256_n8.o > matmul_256_n8.out ; } 2> matmul_256_n8.time
{ time mpirun --hostfile cluster-fasilkom-hosts -np 8 matmul_512_n8.o > matmul_512_n8.out ; } 2> matmul_512_n8.time
{ time mpirun --hostfile cluster-fasilkom-hosts -np 8 matmul_1024_n8.o > matmul_1024_n8.out ; } 2> matmul_1024_n8.time
{ time mpirun --hostfile cluster-fasilkom-hosts -np 8 matmul_2048_n8.o > matmul_2048_n8.out ; } 2> matmul_2048_n8.time
{ time mpirun --hostfile cluster-fasilkom-hosts -np 8 matmul_4096_n8.o > matmul_4096_n8.out ; } 2> matmul_4096_n8.time
{ time mpirun --hostfile cluster-fasilkom-hosts -np 8 matmul_8192_n8.o > matmul_8192_n8.out ; } 2> matmul_8192_n8.time

{ time mpirun --hostfile cluster-fasilkom-hosts -np 16 matmul_128_n16.o > matmul_128_n16.out ; } 2> matmul_128_n16.time
{ time mpirun --hostfile cluster-fasilkom-hosts -np 16 matmul_256_n16.o > matmul_256_n16.out ; } 2> matmul_256_n16.time
{ time mpirun --hostfile cluster-fasilkom-hosts -np 16 matmul_512_n16.o > matmul_512_n16.out ; } 2> matmul_512_n16.time
{ time mpirun --hostfile cluster-fasilkom-hosts -np 16 matmul_1024_n16.o > matmul_1024_n16.out ; } 2> matmul_1024_n16.time
{ time mpirun --hostfile cluster-fasilkom-hosts -np 16 matmul_2048_n16.o > matmul_2048_n16.out ; } 2> matmul_2048_n16.time
{ time mpirun --hostfile cluster-fasilkom-hosts -np 16 matmul_4096_n16.o > matmul_4096_n16.out ; } 2> matmul_4096_n16.time
{ time mpirun --hostfile cluster-fasilkom-hosts -np 16 matmul_8192_n16.o > matmul_8192_n16.out ; } 2> matmul_8192_n16.time

{ time mpirun --hostfile cluster-fasilkom-hosts -np 32 matmul_128_n32.o > matmul_128_n32.out ; } 2> matmul_128_n32.time
{ time mpirun --hostfile cluster-fasilkom-hosts -np 32 matmul_256_n32.o > matmul_256_n32.out ; } 2> matmul_256_n32.time
{ time mpirun --hostfile cluster-fasilkom-hosts -np 32 matmul_512_n32.o > matmul_512_n32.out ; } 2> matmul_512_n32.time
{ time mpirun --hostfile cluster-fasilkom-hosts -np 32 matmul_1024_n32.o > matmul_1024_n32.out ; } 2> matmul_1024_n32.time
{ time mpirun --hostfile cluster-fasilkom-hosts -np 32 matmul_2048_n32.o > matmul_2048_n32.out ; } 2> matmul_2048_n32.time
{ time mpirun --hostfile cluster-fasilkom-hosts -np 32 matmul_4096_n32.o > matmul_4096_n32.out ; } 2> matmul_4096_n32.time
{ time mpirun --hostfile cluster-fasilkom-hosts -np 32 matmul_8192_n32.o > matmul_8192_n32.out ; } 2> matmul_8192_n32.time

{ time mpirun --hostfile cluster-fasilkom-hosts -np 64 matmul_128_n64.o > matmul_128_n64.out ; } 2> matmul_128_n64.time
{ time mpirun --hostfile cluster-fasilkom-hosts -np 64 matmul_256_n64.o > matmul_256_n64.out ; } 2> matmul_256_n64.time
{ time mpirun --hostfile cluster-fasilkom-hosts -np 64 matmul_512_n64.o > matmul_512_n64.out ; } 2> matmul_512_n64.time
{ time mpirun --hostfile cluster-fasilkom-hosts -np 64 matmul_1024_n64.o > matmul_1024_n64.out ; } 2> matmul_1024_n64.time
{ time mpirun --hostfile cluster-fasilkom-hosts -np 64 matmul_2048_n64.o > matmul_2048_n64.out ; } 2> matmul_2048_n64.time
{ time mpirun --hostfile cluster-fasilkom-hosts -np 64 matmul_4096_n64.o > matmul_4096_n64.out ; } 2> matmul_4096_n64.time
{ time mpirun --hostfile cluster-fasilkom-hosts -np 64 matmul_8192_n64.o > matmul_8192_n64.out ; } 2> matmul_8192_n64.time