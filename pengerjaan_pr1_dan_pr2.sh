# ssh kawung
alias ssh-kawung='ssh -i ~/.ssh/arkha.sayoga_kawung.key arkha.sayoga@kawung.cs.ui.ac.id -p 12122'

# ssh cluster fasilkom
alias ssh-cluster-20='ssh user20@34.82.223.138 -p 10002'

# ssh gpu-01 (Nvidia GTX 1080)
alias ssh-gpu-01-20='ssh user20@34.82.223.138 -p 13002'

# ssh gpu-03 (Multicore)
alias ssh-gpu-03-20='ssh user20@34.82.223.138 -p 11002'

# ssh a100
alias ssh-a100='ssh paralel2022@34.82.223.138 -p 6000'

# lihat pods
kubectl get pods

# masuk pods
kubectl exec -it namapods /bin/bash

# github
git clone https://github.com/arkha98/UI-2-ParallelProgramming.git
cd UI-2-ParallelProgramming
git submodule init
git submodule update

# PR 1
#=====
# Topik 1
mpicc greeting.c -o greeting.o
time mpirun --hostfile multicore-hosts -np 64 greeting.o

mpicc greeting.c -o greeting.o
sbatch run_greeting_cluster_helper.sh

#!/bin/bash
#SBATCH -p batch
#SBATCH -N 8
#SBATCH --nodelist=node-01,node-02,node-03,node-04,node-05,node-06,node-07,node-08
time mpirun --hostfile cluster-hosts -np 64 /home/user20/UI-2-ParallelProgramming/greeting.o > /home/user20/UI-2-ParallelProgramming/greeting.out

# Topik 2
mpicc matmul_128.c -o matmul_128.o
time mpirun --hostfile multicore-hosts -np 64 matmul_128.o

# Topik 3
mpicc mpi_graph_create.c -o mpi_graph_create.o
time mpirun --hostfile multicore-hosts -np 4 mpi_graph_create.o

mpicc mpi_cart_create.c -o mpi_cart_create.o
time mpirun --hostfile multicore-hosts -np 12 mpi_cart_create.o

# Topik 4
# Ada di folder hpcg
mkdir /home/user20/UI-2-ParallelProgramming/hpcg/build_linux
cd /home/user20/UI-2-ParallelProgramming/hpcg/build_linux
/home/user20/UI-2-ParallelProgramming/hpcg/configure Linux_MPI
make
cp /home/user20/UI-2-ParallelProgramming/hpcg.dat /home/user20/UI-2-ParallelProgramming/hpcg/build_linux/bin/
mpirun --hostfile /home/user20/UI-2-ParallelProgramming/multicore-hosts -np 64 ./bin/xhpcg

#!/bin/bash
#SBATCH -p batch
#SBATCH -N 8
#SBATCH --nodelist=node-01,node-02,node-03,node-04,node-05,node-06,node-07,node-08

mkdir /home/user20/UI-2-ParallelProgramming/hpcg/build_linux
cd /home/user20/UI-2-ParallelProgramming/hpcg/build_linux
/home/user20/UI-2-ParallelProgramming/hpcg/configure Linux_MPI
make
cp /home/user20/UI-2-ParallelProgramming/hpcg.dat /home/user20/UI-2-ParallelProgramming/hpcg/build_linux/bin/
mpirun --hostfile /home/user20/UI-2-ParallelProgramming/cluster-hosts -np 64 ./bin/xhpcg --mca btl_tcp_if_exclude docker0,lo

# PR 2
#=====
# Topik 1 (Cuda 10)
nvcc increment.cu -o increment.o
./increment.o

nvcc minimal_kernel.cu -o minimal_kernel.o
./minimal_kernel.o

# Topik 2 (Cuda 10)
# Ada di folder matmul-cuda

nvcc matmul_cuda_128.cu -o matmul_cuda_128.o
./matmul_cuda_128.o

# Topik 3 (Cuda 10)
# Ada di folder cgls-custom
cp Makefile.cuda10 Makefile
make cgls_128
./cgls_128 > cgls_128.out
make clean

# Topik 4 (Tensorflow)
# Ada di folder benchmarks/scripts/tf_cnn_benchmarks
python ./tf_cnn_benchmarks.py --num_gpus=1 --batch_size=32 --model=resnet50 --variable_update=parameter_server > /workspace/user20/benchmarks.out