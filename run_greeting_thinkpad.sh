#!/bin/bash
mpicc greeting.c -o greeting.o
time mpirun --hostfile yoga-thinkpad-hosts -np 4 greeting.o --mca opal_warn_on_missing_libcuda 0