mpicc mpi_cart_create.c -o mpi_cart_create.o
time mpirun --hostfile yoga-hosts mpi_cart_create.o --mca opal_warn_on_missing_libcuda 0
echo "8 proses"