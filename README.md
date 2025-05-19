# 🧬 NGS Analysis Pipeline

A reproducible, containerized bioinformatics pipeline for Next-Generation Sequencing (NGS) data analysis. This pipeline processes raw FASTQ files through quality control, trimming, assembly, mapping, and variant calling, orchestrated via a Python script (`main.py`) within a Docker container.

## 📋 Features

- **Quality Control**: FastQC for read quality assessment
- **Trimming**: Trimmomatic for adapter and quality trimming
- **Assembly**: SPAdes for de novo assembly
- **Mapping**: BWA and Samtools for read alignment
- **Variant Calling**: GATK and Samtools for identifying variants
- **Containerized**: Runs in Docker for portability and reproducibility

## 📁 Project Structure
ngs-pipeline/
├── data/                         # Input/output directory for FASTQ, BAM, VCF, etc.
├── scripts/                      #scripts for each pipeline stage
│   ├── qc.sh
│   ├── trim.sh
│   ├── assembly.sh
│   ├── mapping.sh
│   └── variant_calling.sh
├── main.py                       # Orchestrates pipeline execution
├── Dockerfile                    # Docker container setup
├── .gitignore                    # Ignores large data files
└── README.md                     # This file with instructions


## 🚀 Quick Start

### Prerequisites

- [Docker](https://docs.docker.com/get-docker/) installed on your system
- Input FASTQ files (e.g., `sample_R1.fq`, `sample_R2.fq`)

### Clone the Repository
git clone https://github.com/maridada/ngs-pipeline.git
cd ngs-pipeline

## Prepare Input Data
Place your raw FASTQ files in the data/ directory. Example:
ngs-pipeline/data/
├── sample_R1.fq
└── sample_R2.fq
Note: Do not commit large FASTQ files to Git.

## Build the Docker Image
docker build -t ngs-pipeline .

## Run the Pipeline
docker run --rm -v $(pwd)/data:/pipeline/data ngs-pipeline

This command:
Mounts the local data/ directory to /pipeline/data in the container
Executes main.py to run all pipeline stages
Writes outputs back to the data/ directory

## View Outputs
Results are saved in the data/ directory, including:
fastqc_report.html: Quality control reports
trimmed_sample_R1.fq, trimmed_sample_R2.fq: Trimmed reads
contigs.fasta: Assembled contigs
aligned_reads.bam: Aligned reads
variants.vcf: Variant calls


🧠 How It Works
The main.py script orchestrates the pipeline by running shell scripts sequentially:

Each script in the scripts/ directory corresponds to a pipeline stage, executed within the Docker container.

📷 Pipeline Flow

FASTQ Files
    ↓
FastQC (Quality Control)
    ↓
Trimmomatic (Trimming)
    ↓
SPAdes (Assembly)
    ↓
BWA + Samtools (Mapping)
    ↓
GATK + Samtools (Variant Calling)
    ↓
VCF and Other Outputs

🧰 Requirements
Docker: All tools (FastQC, Trimmomatic, SPAdes, BWA, Samtools, GATK) are pre-installed in the Docker image.
Input Files: Paired-end FASTQ files (e.g., sample_R1.fq, sample_R2.fq).
Hardware: At least 8GB RAM and 4 CPU cores recommended for SPAdes and GATK.

⚙️ Customization
Modify Stages: Edit main.py to skip or reorder pipeline steps.
Adjust Parameters: Update shell scripts in scripts/ for tool-specific configurations.
Data Paths: Ensure input/output paths in shell scripts match your data/ directory structure.

📝 Notes
Ensure Docker has write permissions for the data/ directory.
Large datasets may require significant disk space and compute resources.
For debugging, check logs in the data/ directory or modify main.py for verbose output.

🐛 Troubleshooting
Docker Build Fails: Verify Dockerfile syntax and ensure internet access for package downloads.
Pipeline Errors: Check shell script logs in data/ for tool-specific errors.
Missing Outputs: Confirm input FASTQ files are in data/ and correctly named.

👩🏽‍💻Author
Maria Dada-Olorunwa
GitHub: @maridada


