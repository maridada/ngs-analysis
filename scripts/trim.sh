#!/bin/bash
source /opt/conda/etc/profile.d/conda.sh
conda activate ngs-etl
# then run the rest of your commands


input_r1="/pipeline/data/ecoli_test_reads1.fq"
input_r2="/pipeline/data/ecoli_test_reads2.fq"

output_dir="$HOME/ngs-pipeline/data/trimmed"
mkdir -p "$output_dir"

base1=$(basename "$input_r1" .fq)
base2=$(basename "$input_r2" .fq)

output_r1_paired="$output_dir/${base1}_trimmed_paired.fq"
output_r1_unpaired="$output_dir/${base1}_trimmed_unpaired.fq"
output_r2_paired="$output_dir/${base2}_trimmed_paired.fq"
output_r2_unpaired="$output_dir/${base2}_trimmed_unpaired.fq"

trimmomatic PE -phred33 \
  "$input_r1" "$input_r2" \
  "$output_r1_paired" "$output_r1_unpaired" \
  "$output_r2_paired" "$output_r2_unpaired" \
  SLIDINGWINDOW:4:20 MINLEN:50
