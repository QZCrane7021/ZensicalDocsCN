#!/bin/zsh
set -e
set -o pipefail

source ~/miniconda3/etc/profile.d/conda.sh
conda activate zensical
zensical serve