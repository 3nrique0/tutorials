#! /usr/bin/bash
# slurm parameters

#SBATCH -J myscript.sh
#SBATCH -p workq

## GENERAL COMMENTS
## This .sh script contains some parameters for SLURM
## This script works just as well on a bash interface
## The reason being that bash is the default shell in both:
## in the server and in the nodes of the cluster

# First part of the script
echo "Hello $USER"
echo "I'm $HOST. Welcome to you."
echo "The date and time are: $(date)"


# Second part of the script
sleep 60
echo "Sixty seconds have passed since the last print"
date
