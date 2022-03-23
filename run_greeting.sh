mpicc greeting.c -o greeting.o
time mpirun --hostfile yoga-hosts -np 8 greeting.o --mca opal_warn_on_missing_libcuda 0 --use-hwthread-cpus 1