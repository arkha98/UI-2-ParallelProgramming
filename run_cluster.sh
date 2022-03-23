mpicc greeting.c -o greeting.o
time mpirun --hostfile cluster-fasilkom-hosts -np 25 /home/user20/UI-2-ParallelProgramming/greeting.o --nodelist node-01,node-03,node-05 --use-hwthread-cpus 10