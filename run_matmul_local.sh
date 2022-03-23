mpicc matmul.c -o matmul.o
time mpirun --hostfile yoga-hosts -np 1 matmul.o --mca opal_warn_on_missing_libcuda 0 --use-hwthread-cpus 1