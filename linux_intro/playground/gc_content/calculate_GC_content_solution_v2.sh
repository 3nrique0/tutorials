#! /bin/bash


### CALCULATE GC CONTETNS OF A GENOME
### Or for the lolz, of any text file :-P


##########################################
## GO TO THE PROPER DIRECTORY
##########################################



## Set working directory
#cd {path}/linux_intro/play_ground

## After that you can use only relative paths,



##########################################
## SET INPUT FILE
##########################################

## Set file to be used as input
#ln -s sgtpepper/sgtpepper input
unlink input
ln -s ../../data/genome/GCF_000146045.2_R64_genomic.fna.gz input



##########################################
## START SCRIPTING THE PROCESS
##########################################


## Remove lines which are not relevant
#zgrep "^>" -v input


##########################################
## COUNT STUFF
##########################################

## Calculate the total number of effective lines 
numLines=`zgrep "^>" -v input | wc -l`
echo "Number of lines:	 ${numLines}"


## Calculate the total number of effective characters
numChars=`zgrep "^>" -v input | wc -c`
echo "Number of characters:	 ${numChars}"



## Count the number of c and C
#numC=`zgrep "^>" -v input | grep "c" -i -o | wc -l`
#echo "Number of C:	${numC}"


## Count the number of g and G
#numG=`zgrep "^>" -v input | grep "g" -i -o | wc -l`
#echo "Number of G:	${numG}"


## BONUS: Can you count c, C, g and G in one go ?
numGC=`zgrep "^>" -v input | grep "[gc]" -i -o | wc -l`
echo "Number of GC: ${numGC}"



##########################################
## CALCULATE STUFF
##########################################

# Make the calculation with awk
# ((#C + #G)*100) (#chars - #lines)
pGC=`awk -v numGC="$numGC" -v numChars="$numChars" -v numLines="$numLines" 'BEGIN {print ( (numGC * 100) / (numChars - numLines) ) }'`
echo "GC percentage:	${pGC}"

