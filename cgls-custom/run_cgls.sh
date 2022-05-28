#!/bin/bash

make cgls
make cgls_128
make cgls_256
make cgls_512
make cgls_1024
make cgls_2048
make cgls_4096
make cgls_8192

./cgls_128
./cgls_256
./cgls_512
./cgls_1024
./cgls_2048
./cgls_4096
./cgls_8192

make clean