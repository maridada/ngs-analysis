#!/bin/bash

source /opt/conda/etc/profile.d/conda.sh
conda activate ngs-etl

bash scripts/qc.sh
bash scripts/trim.sh
bash scripts/assembly.sh
bash scripts/map.sh
bash scripts/variant.sh
