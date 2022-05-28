#!/bin/bash

cp Makefile.cuda11 Makefile

make cgls
make cgls_128
make cgls_256
make cgls_512
make cgls_1024
make cgls_2048
make cgls_4096
make cgls_8192

./cgls_128 > cgls_128.out
./cgls_256 > cgls_256.out
./cgls_512 > cgls_512.out
./cgls_1024 > cgls_1024.out
./cgls_2048 > cgls_2048.out
./cgls_4096 > cgls_4096.out
./cgls_8192 > cgls_8192.out

make clean
