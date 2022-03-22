#!/bin/sh
#SBATCH -o greeting.out
#SBATCH -p batch
#SBATCH -N 4
#SBATCH -nodelist=node-01,node-03,node-05

echo "4 core"
start=`date +%s.%N`

mpirun greeting.o -p batch -N 4 -nodelist=node-01,node-03,node-05

end=`date +%s.%N`
runtime=$( echo "$end - $start" | bc -l )
echo $runtime