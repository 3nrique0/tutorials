#! /usr/bin/bash
# slurm parameters

#SBATCH -J myscript.sh
#SBATCH -p workq

echo "Hello $USER, it is:"
date
sleep 60
echo "Sixty seconds have passed since the last print"
date
