#! /bin/bash

#SBATCH -J R_test
##SBATCH -p workq
#SBATCH --mem=20M
#SBATCH --mail-user=enrique.ortega@ird.fr
#SBATHC --mail-type=ERROR
#SBATCH -e error.txt
#SBATCH -o output.txt


# module load system/R-4.1.2_gcc-9.3.0

Rscript myscript.R