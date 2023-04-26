#! /bin/bash

#SBATCH -J python_test
##SBATCH -p workq
#SBATCH --mem=8M

python --version > python_version.txt

# module load system/Python-3.11.1

python myscript.py
