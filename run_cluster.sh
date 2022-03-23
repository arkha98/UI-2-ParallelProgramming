#!/bin/sh
echo "24 core"
start=`date +%s.%N`

mpirun --hostfile cluster-fasilkom-hosts --nodelist=node-01,node-03,node-05 -p batch -N 3 -np 24 /home/user20/UI-2-ParallelProgramming/matmul.o

end=`date +%s.%N`
runtime=$( echo "$end - $start" | bc -l )
echo $runtime