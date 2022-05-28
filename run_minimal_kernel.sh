#!/bin/bash

nvcc minimal_kernel.cu -o minimal_kernel.o

./minimal_kernel.o > minimal_kernel.out
