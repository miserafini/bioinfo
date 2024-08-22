#!/bin/bash

# Inputs:
FASTQ_DIR=/home/michele/data/sratoolkit/sra
OUTPUT_DIR=/home/michele/data/sratoolkit/sra/

# Start script:
cd $FASTQ_DIR

for fastqfile in $(ls *.fastq*);
do
    echo ===== FastQC is processing $fastqfile !
    fastqc $fastqfile -o $OUTPUT_DIR
    echo ===== FastQC finished processing $fastqfile ! Output is $OUTPUT_DIR
done