#!/bin/bash

## Set the EOL (End Of Lines) to unix with Notepad++

#	Open the fasta file : Gm_Versions_All.fasta
#	Select all sequences ^a
#	Go to Edit > EOL Conversion > Unix (LF)
#	Save the new version as a new file : Gm_Versions_All_unix.fasta


fastawindows='Gm_Versions_All.fasta'
fastaunix='Gm_Versions_All_unix.fasta'
fastasingleline='Gm_Versions_All_1line.fasta'


## Set fasta sequences in one line fasta. This will add a blank line at the begining of the file

awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $fastaunix  > $fastasingleline




## Check with less

#less -N $fastasingleline


## Are there any duplicate sequences. Strict duplication only !

#### How many UNIQUE lines are there ?  --- Beware there is a blank line at the begining of the file.
echo "Number of unique sequences:"
grep -v '^>' $fastasingleline | sort | uniq -c | wc -l
# 85

#### How many total lines are there ?
echo "Number of total sequences:"
grep -v '^>' $fastasingleline | sort | wc -l
# 86

echo -e '\nIf numbers differe there are duplicates\n'


## To find out which are the duplicate lines use uniq -d
echo 'The following sequences are the duplicated sequences (only once each duplicated sequence !! ):'
grep -v '^>' $fastasingleline | sort | uniq -d

#the lines which are present more than once will be printed to the screen.

#To get which line the duplicates are, copy/paste the string in grep -n. Remember that in bash ubuntu for windows your need to right mouse click to paste, not ^v.


#grep -n 'ATGTTACGTTCATCAAACGATGTCACCCAACAGGGCTCACGTCCCAAAACAAAACTGGGTGGCAGCAGTATGGGTATTATCCGGACCTGTCGCCTGGGTCCGGACCAGGTGAAAAGCATGCGCGCGGCACTGGATCTGTTCGGACGTGAGTTTGGGGACGTGGCCACATATTCTCAGCATCAACCCGACTCAGACTACCTGGGCAATCTGCTGCGCAGTAAAACCTTCATCGCCCTGGCGGCTTTCGACCAGGAAGCCGTAGTTGGTGCCCTAGCAGCATATGTGCTCCCCCGCTTCGAACAGCCGCGGTCCGAAATTTACATTTATGATCTTGCAGTTTCAGGTGAACATCGCCGCCAGGGAATAGCCACCGCACTGATCAACCTGCTGAAACATGAAGCGAATGCGTTGGGTGCCTACGTAATCTATGTGCAGGCCGACTATGGGGATGATCCGGCCGTAGCTCTGTATACCAAATTGGGTATTCGCGAAGAAGTGATGCACTTCGATATTGATCCCTCGACTGCCACGTAA' $fastasingleline  
