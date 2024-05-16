#!/bin/bash

#Loop for prefetch
# It works, and saves the .sra files in the right output_dir. :)

# SECONDS=0

# Inputs:
OUTPUT_DIR=/home/mserafini/workspace/sratoolkit.3.1.0-ubuntu64/cache/sra
SRA_DIR=/home/mserafini/Downloads/
srafile=SRR_Acc_List1.txt


cd $SRA_DIR

while IFS= read -r srafile; do
    echo "===== prefetch is processing $srafile !"
    prefetch "$srafile" -O $OUTPUT_DIR
    mv "${OUTPUT_DIR}/$srafile/$srafile.sra" $OUTPUT_DIR
    echo "===== prefetch finished processing $srafile ! Output is $OUTPUT_DIR"
    # echo "${OUTPUT_DIR}/$srafile/$srafile.sra copying to $OUTPUT_DIR" 
    rm -r "${OUTPUT_DIR}/$srafile"
    echo "Temporary folder was deleted"
done < SRR_Acc_List1.txt


# duration=$SECONDS
# echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."
