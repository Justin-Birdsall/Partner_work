#!/bin/bash

block_sizes=(32 64 128 256)
associativity_values=(1 2 4 8 16)

for block_size in "${block_sizes[@]}"; do
    for associativity in "${associativity_values[@]}"; do
        valgrind --tool=cachegrind --D1=8192,${associativity},${block_size} ./qsort input_1e4 2> output_${associativity}_${block_size}
    done
done
