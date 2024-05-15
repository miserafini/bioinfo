#!/bin/bash

SECONDS=0

# change working directory
#cd /home/michele/data/scripts

# STEP 1: Run fastqc. OBS: For paired data, include both forward and reverse strands!
#fastqc /home/michele/data/sratoolkit/sra/SRR22333186_1.fastq -o /home/michele/data/sratoolkit/sra/
#fastqc /home/michele/data/sratoolkit/sra/SRR22333186_2.fastq -o /home/michele/data/sratoolkit/sra/
#echo "Fastqc1 finished running!"
#echo "Fastqc1 silenced"

# Run Trimmomatic to trim reads with poor quality - source: http://www.usadellab.org/cms/?page=trimmomatic
# OBS: The following code is a sample, change the file names for your files!
#Paired end mode - PE
#java -jar trimmomatic-0.39.jar PE -phred33 input_forward.fq.gz input_reverse.fq.gz output_forward_paired.fq.gz output_forward_unpaired.fq.gz output_reverse_paired.fq.gz output_reverse_unpaired.fq.gz ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:2:True LEADING:3 TRAILING:3 MINLEN:36
#Single end mode - SE
#java -jar trimmomatic-0.35.jar SE -phred33 input.fq.gz output.fq.gz ILLUMINACLIP:TruSeq3-SE:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

# Run Trimmomatic to trim reads with poor quality - your samples
#java -jar /home/michele/Trimmomatic-0.39/trimmomatic-0.39.jar PE -threads 4 -phred33 /home/michele/data/sratoolkit/sra/SRR22333186_1.fastq /home/michele/data/sratoolkit/sra/SRR22333186_2.fastq /home/michele/data/sratoolkit/sra/trimmed/SRR22333186_1_trim_paired.fastq /home/michele/data/sratoolkit/sra/SRR22333186_1_trim_unpaired.fastq /home/michele/data/sratoolkit/sra/trimmed/SRR22333186_2_trim_paired.fastq /home/michele/data/sratoolkit/sra/trimmed/SRR22333186_2_trim_unpaired.fastq ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:2:True LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
#echo "Trimmomatic finished running!"

# Run fastqc again for quality control after trimming
#fastqc /home/michele/data/sratoolkit/sra/trimmed/SRR22333186_1_trim_paired.fastq -o /home/michele/data/sratoolkit/sra/trimmed/
#fastqc /home/michele/data/sratoolkit/sra/trimmed/SRR22333186_2_trim_paired.fastq -o /home/michele/data/sratoolkit/sra/trimmed/
#fastqc /home/michele/data/sratoolkit/sra/trimmed/SRR22333186_1_trim_unpaired.fastq -o /home/michele/data/sratoolkit/sra/trimmed/
#fastqc /home/michele/data/sratoolkit/sra/trimmed/SRR22333186_2_trim_unpaired.fastq -o /home/michele/data/sratoolkit/sra/trimmed/
#echo "Fastqc2 finished running trimmed reads!"

# STEP 2: Run HISAT2
mkdir HISAT2
# Get the genome indices
wget https://genome-idx.s3.amazonaws.com/hisat/grch38_genome.tar.gz

# Run Alignment

# STEP 3: Run featureCounts - Quantification
# get gtf
# wget http://ftp.ensembl.org/pub/release-106/gtf/homo_sapiens/Homo_sapiens.GRCh38.106.gtf.gz
# featureCounts -S 2 -a ../hg38/Homo_sapiens.GRCh38.106.gtf -o quants/demo_featurecounts.txt HISAT2/demo_trimmed.bam
# echo "featureCounts finished running!"


duration=$SECONDS
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."