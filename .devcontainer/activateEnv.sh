#!/bin/bash
source "${HOME}/conda/etc/profile.d/conda.sh"
conda activate
conda env create --file .devcontainer/env-files/packaging-env.yml
