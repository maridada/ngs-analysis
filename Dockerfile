# Use an Ubuntu base
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install basic dependencies
RUN apt-get update && apt-get install -y \
    wget \
    bzip2 \
    ca-certificates \
    openjdk-11-jre-headless \
    unzip \
    git \
    curl \
    && apt-get clean

# Install Miniconda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh && \
    bash /tmp/miniconda.sh -b -p /opt/conda && \
    rm /tmp/miniconda.sh

# Add conda to PATH
ENV PATH=/opt/conda/bin:$PATH

# Update conda and install trimmomatic + other bioinformatics tools from bioconda
RUN conda update -n base -c defaults conda -y && \
    conda config --add channels defaults && \
    conda config --add channels bioconda && \
    conda config --add channels conda-forge && \
    conda install -y trimmomatic fastqc bwa samtools gatk4 spades python=3.10

# Set working directory
WORKDIR /pipeline

COPY ngs.yml /pipeline/
RUN conda env create -f /pipeline/ngs.yml

COPY scripts/ /pipeline/scripts/
COPY main.py /pipeline/main.py


# Default command to keep container alive or run bash
CMD ["bash"]
