CULDFLAGS=-L/usr/local/cuda/lib

cgls: cgls.cu cgls.cuh
	nvcc -O3 -m64 -arch=sm_75 -o $@ -lcublas -lcusparse $(CULDFLAGS) $<

clean:
	rm -rf *.o cgls
