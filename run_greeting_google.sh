#!/bin/bash
mpicc greeting.c -o greeting.o
time mpirun --hostfile google-hosts -np 1 greeting.o