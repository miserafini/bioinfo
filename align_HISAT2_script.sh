#!/bin/bash
# Script for alignment with HISAT2 in bash

# Pro tip: always declare variables (inputs) at the top of the script.
# Each time you use the code, just change the variables paths for each sample, and you won't need to edit the rest of the code! (just adapt if paired or unpaired ends)

SECONDS=0

# Inputs 
forward=/home/michele/data/sratoolkit/sra/trimmed/SRR22333181_1_trim_paired.fastq
reverse=/home/michele/data/sratoolkit/sra/trimmed/SRR22333181_2_trim_paired.fastq
output=SRR22333181.sam #Always a .sam file!!
#unpaired=

# Change directory
cd /home/michele/data/HISAT2

# Index your reference genome
# Paired end reads mode
hisat2 -q -p8 -x /home/michele/data/HISAT2/grch38_genome/grch38/genome -1 $forward -2 $reverse -S $output


# -q tells the code that my data is in .fastq
# -p8 tells the code to use 8 core processors (it will run faster than just 1 core)
# -x specifies the index genome (reference genome)
# -S specifies the output name
# use -U for unpaired reads, and -1 -2 for paired reads


# Unpaired end reads mode
#-q -p8 -x /home/michele/data/HISAT2/grch38_genome/grch38/genome -U $unpaired -S $output


duration=$SECONDS
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."