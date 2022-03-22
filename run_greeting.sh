echo "4 core"
start=`date +%s.%N`

mpirun greeting.o --mca opal_warn_on_missing_libcuda 0 -NP 4 --use-hwthread-cpus 4

end=`date +%s.%N`
runtime=$( echo "$end - $start" | bc -l )
echo $runtime