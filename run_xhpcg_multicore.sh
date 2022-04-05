mkdir /home/user20/UI-2-ParallelProgramming/hpcg/build_linux
cd /home/user20/UI-2-ParallelProgramming/hpcg/build_linux
/home/user20/UI-2-ParallelProgramming/hpcg/configure Linux_MPI
make
cp /home/user20/UI-2-ParallelProgramming/hpcg.dat /home/user20/UI-2-ParallelProgramming/hpcg/build_linux/bin/
mpirun --hostfile /home/user20/UI-2-ParallelProgramming/multicore-hosts -np 64 ./bin/xhpcg