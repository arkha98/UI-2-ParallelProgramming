#!/bin/bash
mpicc greeting.c -o greeting.o
{ time mpirun --hostfile google-hosts -np 2 greeting.o > greeting.out ; } 2> greeting.time