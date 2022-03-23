mpicc greeting.c -o greeting.o
time mpirun --hostfile=cluster-fasilkom-hosts --nodelist=node-01,node-03,node-05 -p batch -N 3 -np 24 /home/user20/UI-2-ParallelProgramming/matmul.o