#! /bin/bash


### CALCULATE GC CONTETNS OF A GENOME
### Or for the lolz, of any text file :-P

## This program will use only one argument: $1


# Remove lines which are not relevant
#zgrep "^>" -v input


# Calculate the total number of effective lines 
numLines=`zgrep "^>" -v $1 | wc -l`
echo "Number of lines:	 ${numLines}"


# Calculate the total number of effective characters
numChars=`zgrep "^>" -v $1 | wc -c`
echo "Number of characters:	 ${numChars}"



# Count the number of c and C
numC=`zgrep "^>" -v $1 | grep "c" -i -o | wc -l`
echo "Number of C:	${numC}"


# Count the number of g and G
numG=`zgrep "^>" -v $1 | grep "g" -i -o | wc -l`
echo "Number of G:	${numG}"


## BONUS: Can you count c, C, g and G in one go ?
numGC=`zgrep "^>" -v $1 | grep "[gc]" -i -o | wc -l`
echo "Number of GC: ${numGC}"



# Make the calculation with awk
# ((#C + #G)*100) (#chars - #lines)
pGC=`awk -v numGC="$numGC" -v numChars="$numChars" -v numLines="$numLines" 'BEGIN {print ( (numGC * 100) / (numChars - numLines) ) }'`
echo "GC percentage:	${pGC}"

