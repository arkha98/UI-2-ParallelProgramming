#!/bin/bash
mpicc greeting.c -o greeting.o
{ time mpirun --hostfile multicore-hosts -np 64 greeting.o > greeting.out ; } 2> greeting.time