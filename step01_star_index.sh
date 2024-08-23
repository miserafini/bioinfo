#!/bin/sh
#SBATCH -J star_index_2          
#SBATCH --time=40:00:00 
#SBATCH --partition=parallel
#SBATCH --cpus-per-task=8
#SBATCH --mem=64G

GENOME_DIR=/scratch/hpc/07/serafini/genome
GENOME_FASTA_FILE=/scratch/hpc/07/serafini/genome/GRCh38.primary_assembly.genome.fa
GTF_FILE=/scratch/hpc/07/serafini/genome/gencode.v29.annotation.gtf


# Initialise the environment modules
module load star/2.7.10a 

# Execute your program
# Run STAR alignment
STAR --runThreadN 8 \
	 --runMode genomeGenerate \
	 --genomeDir $GENOME_DIR \
	 --genomeFastaFiles $GENOME_FASTA_FILE \
	 --sjdbGTFfile $GTF_FILE \
	 --sjdbOverhang 100 \
	 --limitGenomeGenerateRAM 63000000000