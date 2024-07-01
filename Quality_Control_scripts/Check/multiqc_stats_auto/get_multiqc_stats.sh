#!/bin/bash

#Get proyect parameter
PROYECT=$1
PE_TREATMENT=$2

#Set paths
DATASETS_DIR=/storage/tbc/gut_core/NHP_Metagenomes
MULTIQC_RAW=${DATASETS_DIR}/${PROYECT}/QC/MULTIQC/raw/multiqc_data
MULTIQC_FASTP=${DATASETS_DIR}/${PROYECT}/QC/MULTIQC/fastp/multiqc_data
MULTIQC_BW2=${DATASETS_DIR}/${PROYECT}/QC/MULTIQC/bowtie/multiqc_data
OUTPUT_DIR=${DATASETS_DIR}/${PROYECT}/QC/stats

#Run
python3 multiqc_stats_auto.py -i1 $MULTIQC_RAW -i2 $MULTIQC_FASTP $MULTIQC_BW2 -i2_names fastp bowtie2 --paired_treatment $PE_TREATMENT -op $PROYECT -o $OUTPUT_DIR
