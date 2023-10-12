#! /bin/bash

#SBATCH -J R_test
##SBATCH -p workq
#SBATCH --mem=20M
#SBATCH --mail-user=sample.name@institute.com
#SBATHC --mail-type=BEGIN,END,FAIL
#SBATCH -e R_error.txt
#SBATCH -o R_output.txt

# module load statistics/R/4.3.0

Rscript myscript.R
