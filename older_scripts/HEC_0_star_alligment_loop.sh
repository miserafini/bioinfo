#!/bin/bash
#Loop for STAR allignment

# Inputs:
# Directory containing your fastq files
FASTQ_DIR="/scratch/hpc/07/serafini/genome"

# Output directory for aligned files
OUTPUT_DIR="/scratch/hpc/07/serafini/genome/alligned"

# Path to the STAR genome index
STAR_INDEX="/scratch/hpc/07/serafini/genome"

# Loop through all fastq files in the directory
for fastq in ${FASTQ_DIR}/*.fastq; do
    # Get the base name of the file (without path and extension)
    base=$(basename ${fastq} .fastq)
    
    # Run STAR alignment
    STAR --genomeDir ${STAR_INDEX} \
         --readFilesIn ${fastq} \
         --outFileNamePrefix ${OUTPUT_DIR}/${base}_ \
         --outSAMtype BAM SortedByCoordinate \
         --runThreadN 8
done