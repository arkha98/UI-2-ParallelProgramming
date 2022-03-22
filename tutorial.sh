echo "4 core"
start=`date +%s.%N`

mpiexec -n 4 python script.py

end=`date +%s.%N`
runtime=$( echo "$end - $start" | bc -l )
echo $runtime