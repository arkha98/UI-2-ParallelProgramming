mkdir /home/arkha_sayoga/UI-2-ParallelProgramming/hpcg/build_linux
cd /home/arkha_sayoga/UI-2-ParallelProgramming/hpcg/build_linux
/home/arkha_sayoga/UI-2-ParallelProgramming/hpcg/configure Linux_MPI
make
mpirun --hostfile /home/arkha_sayoga/UI-2-ParallelProgramming/google-hosts -np 2 ./bin/xhpcg