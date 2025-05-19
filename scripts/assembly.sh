#!/bin/bash

r1="$HOME/ngs-pipeline/data/trimmed/ecoli_test_reads1_trimmed_paired.fq"
r2="$HOME/ngs-pipeline/data/trimmed/ecoli_test_reads2_trimmed_paired.fq"
outdir="$HOME/ngs-pipeline/results/assembly"

mkdir -p "$outdir"

spades.py -1 "$r1" -2 "$r2" -o "$outdir"
