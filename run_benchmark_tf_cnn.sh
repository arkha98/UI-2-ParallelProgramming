#!/bin/bash

python ./benchmarks/script/tf_cnn_benchmarks/tf_cnn_benchmarks.py --num_gpus=1 --batch_size=32 --model=resnet50 --variable_update=parameter_server > ./benchmarks.out