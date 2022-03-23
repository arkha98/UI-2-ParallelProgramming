#!/bin/sh
#SBATCH -o greeting.out
#SBATCH --hostfile cluster-fasilkom-hosts
#SBATCH -p batch
#SBATCH -N 3
#SBATCH --nodelist=node-01,node-03,node-05

echo "24 core"
start=`date +%s.%N`

mpirun -np 24 /home/user20/UI-2-ParallelProgramming/greeting.o

end=`date +%s.%N`
runtime=$( echo "$end - $start" | bc -l )
echo $runtime