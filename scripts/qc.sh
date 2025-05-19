#!/bin/bash

input_fastq1="./data/ecoli_test_reads1.fq"
input_fastq2="./data/ecoli_test_reads2.fq"
output_dir="./results/fastqc_raw"

mkdir -p $output_dir
fastqc $input_fastq1 $input_fastq2 -o $output_dir
