mkdir /home/user20/UI-2-ParallelProgramming/hpcg/build_linux
cd /home/user20/UI-2-ParallelProgramming/hpcg/build_linux
/home/user20/UI-2-ParallelProgramming/hpcg/configure Linux_MPI
make
mpirun --hostfile /home/user20/UI-2-ParallelProgramming/multicore-hosts -np 64 ./bin/xhpcg --nx=128 --ny=128 --nz=128 --rt=1800