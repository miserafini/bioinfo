#!/bin/bash
#SBATCH -J star_index_2          
#SBATCH --time=40:00:00 
#SBATCH --partition=parallel
#SBATCH --cpus-per-task=8
#SBATCH --mem=64G
#Loop for STAR allignment

# Inputs:
# Directory containing your fastq files
FASTQ_DIR="/scratch/hpc/07/serafini/fastq"
# Output directory for aligned files
OUTPUT_DIR="/scratch/hpc/07/serafini/genome/alligned"
# Path to the STAR genome index
STAR_INDEX="/scratch/hpc/07/serafini/genome"

module load star/2.7.10a 

# Loop through all fastq files in the directory
for f in "$FASTQ_DIR"/*/; do
  for fastq_file in "$f"*.fastq.gz; do
    echo "$fastq_file"

    sample_id=$(basename "$f" /)
    sample_suffix=$(basename "$fastq_file" .fastq.gz | sed "s/${sample_id}_//")
    sample_id_lower="${sample_id,,}_${sample_suffix}"

    echo "$sample_id_lower"

    # Run STAR alignment
    STAR --genomeDir ${STAR_INDEX} \
         --readFilesIn ${fastq_file} \
         --outFileNamePrefix ${OUTPUT_DIR}/${sample_id_lower}_ \
         --outSAMtype BAM SortedByCoordinate \
         --runThreadN 8
  done
done