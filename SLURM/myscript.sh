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


# Third part of the script
# Let's get some data! 
echo -e "\nLet's get some data -- Only by stream"
curl https://vincentarelbundock.github.io/Rdatasets/csv/datasets/mtcars.csv | head

# Fouth part
# Let's characterize some variables!

echo -e "\n Let's caracterize some variables!"
echo -e "Download the data"
wget https://vincentarelbundock.github.io/Rdatasets/csv/datasets/mtcars.csv

echo -e "\nThe amount of cars in this file is the number of lines minus the header:"
echo "$(wc -l mtcars.csv | cut -d " " -f1 ) - 1" | bc

echo -e "\nThis is the count for the occurrences of cylinder number (cyl)"
cut -d , -f3 mtcars.csv | sort -n | uniq -c

echo -e "\nThe 3 slowest times for the quarter of a mile (qsec) are:"
cut -d , -f8 mtcars.csv | sort | head -3

echo -e "\nThe number of cars depending on the number of gears they have"
cut -d , -f11 mtcars.csv | sort -n | uniq -c | sed 's/  1 /num /'
