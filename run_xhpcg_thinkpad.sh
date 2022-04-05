mkdir /home/sebelum_masehi/UI-2-ParallelProgramming/hpcg/build_linux
cd /home/sebelum_masehi/UI-2-ParallelProgramming/hpcg/build_linux
/home/sebelum_masehi/UI-2-ParallelProgramming/hpcg/configure Linux_MPI
make
mpirun --hostfile /home/sebelum_masehi/UI-2-ParallelProgramming/yoga-thinkpad-hosts -np 4 ./bin/xhpcg --nx=128 --ny=128 --nz=128 --rt=1800 --mca opal_warn_on_missing_libcuda 0