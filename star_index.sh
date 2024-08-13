
#!/bin/sh
#SBATCH -J star_align            
#SBATCH --time=40:00:00 
#SBATCH --partition=parallel
#SBATCH --cpus-per-task=4
#SBATCH --mem=32G

GENOME_DIR=/scratch/hpc/07/serafini/genome
GENOME_FASTA_FILE=/scratch/hpc/07/serafini/genome/GRCh38.primary_assembly.genome.fa
GTF_FILE=/scratch/hpc/07/serafini/genome/gencode.v29.annotation.gtf


# Initialise the environment modules
module load star

# Execute your program
STAR --runThreadN 16 --runMode genomeGenerate --genomeDir $GENOME_DIR --genomeFastaFiles $GENOME_FASTA_FILE --sjdbGTFfile $GTF_FILE --sjdbOverhang 100
