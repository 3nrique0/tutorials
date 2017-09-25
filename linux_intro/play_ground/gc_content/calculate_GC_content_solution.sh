#! /bin/bash


### CALCULATE GC CONTETNS OF A GENOME
### Or for the lolz, of any text file :-P

# Set working directory
#cd {path}/linux_intro/play_ground

# Set file to be used as input
#ln -s sgtpepper/sgtpepper input
#ln -s ../data/genome/GCF_000146045.2_R64_genomic.fna.gz input


## We'll use zgrep on the first grep in case the input is zipped (.gz)
## We'll use the command echo to give an indication of what the output on the screen is

# Remove lines which are not relevant
#zgrep "^>" -v input


# Calculate the total number of effective lines and characters
echo "Calculate the total number of effective lines and characters"
zgrep "^>" -v input | wc -lc


# Count the number of c and C
echo "Count of c and C"
zgrep "^>" -v input | grep "c" -i -o | wc -l


# Count the number of g and G
echo "Count of g and G"
zgrep "^>" -v input | grep "g" -i -o | wc -l


## BONUS: Can you count c, C, g and G in one go ?
echo "Count c, C, g and G"
zgrep "^>" -v input | grep "[gc]" -i -o | wc -l


# Now what ?
# ((#C + #G)*100) (#chars - #lines)



