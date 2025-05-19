#!/bin/bash

ref="/pipeline/data/ecoli_ref.fa"
bam="/pipeline/results/mapping/aligned_reads.sorted.bam"
vcf_out="/pipeline/results/variants/variants.vcf"

mkdir -p "$(dirname "$vcf_out")"

gatk HaplotypeCaller \
  -R "$ref" \
  -I "$bam" \
  -O "$vcf_out"
