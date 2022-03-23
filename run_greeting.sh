mpicc greeting.c -o greeting.o
time mpirun --hostfile yoga-hosts -np 10 greeting.o --mca opal_warn_on_missing_libcuda 0 --use-hwthread-cpus 1