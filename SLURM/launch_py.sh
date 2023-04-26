#! /bin/bash

#SBATCH -J python_test
##SBATCH -p workq
#SBATCH --mem=8M
##SBATCH --mail-user=name.lastname@inst.com
##SBATHC --mail-type=BEGIN,END,FAIL
##SBATCH -e error.txt
##SBATCH -o output.txt

python --version > python_version.txt

# module load system/Python-3.11.1

python myscript.py
