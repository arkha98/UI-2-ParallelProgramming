echo "4 core"
start=`date +%s.%N`

mpiexec greeting.o --mca opal_warn_on_missing_libcuda 0 -n 10 --use-hwthread-cpus 4

end=`date +%s.%N`
runtime=$( echo "$end - $start" | bc -l )
echo $runtime