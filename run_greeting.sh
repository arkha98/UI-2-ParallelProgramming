echo "1 core"

start=`date +%s.%N`

mpirun greeting.o --use-hwthread-cpus 1

end=`date +%s.%N`

runtime=$( echo "$end - $start" | bc -l )
echo $runtime