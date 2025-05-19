#!/bin/bash

ref="/pipeline/data/ecoli_ref.fa"
reads1="/pipeline/data/trimmed/ecoli_test_reads1_trimmed_paired.fq"
reads2="/pipeline/data/trimmed/ecoli_test_reads2_trimmed_paired.fq"
output_dir="/pipeline/results/mapping"

mkdir -p $output_dir

# Only index if it's not already indexed
if [ ! -f "${ref}.bwt" ]; then
  bwa index $ref
fi

# Mapping to BAM
sam_out="$output_dir/aligned_reads.sam"
bam_out="$output_dir/aligned_reads.bam"
sorted_bam="$output_dir/aligned_reads.sorted.bam"

#bwa mem $ref $reads1 $reads2 > $sam_out
bwa mem -R "@RG\tID:sample1\tSM:sample1\tPL:illumina" $ref $reads1 $reads2 > $sam_out
samtools view -Sb $sam_out > $bam_out
samtools sort $bam_out -o $sorted_bam
samtools index $sorted_bam

# Clean up intermediate files if needed
rm $sam_out $bam_out
