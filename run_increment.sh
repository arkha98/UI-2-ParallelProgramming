#!/bin/bash

nvcc increment.cu -o increment.o

./increment.o > increment.out
