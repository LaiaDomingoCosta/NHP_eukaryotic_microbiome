#!/bin/bash

#Get proyect parameter
PROYECT=$1
TYPE=$2

#Set paths
LOG_DIR=/home/cardocos/TFM/logs/${PROYECT}/metaphlan
DATASETS_DIR=/storage/tbc/gut_core/NHP_Metagenomes
INPUT_DIR=${DATASETS_DIR}/${PROYECT}/FASTQs/bowtie
OUTPUT_DIR=${DATASETS_DIR}/${PROYECT}/metaphlan
metaphlan_DB_DIR=/storage/tbc/gut_core/CoreV2/CIBIO-DBs/metaphlan-Oct22
metaphlan_INDEX=mpa_vOct22_CHOCOPhlAnSGB_202212
GTDB_PROFILE_DB=/storage/tbc/gut_core/CoreV2/CIBIO-DBs/metaphlan-Oct22/mpa_vOct22_CHOCOPhlAnSGB_202212.pkl

#Check INPUT_DIR exits
if [ -d "$INPUT_DIR" ]; then
    #Create output dirs
    ##Create OUTPUT_DIR if not already exist
    if [ ! -d "$OUTPUT_DIR" ]; then
       mkdir ${OUTPUT_DIR}
    fi
    ##Create LOG_DIR if not already exist
    if [ ! -d "$LOG_DIR" ]; then
       mkdir ${LOG_DIR}
    fi
    #Lunch PAIRED or SINGLE subscript
    if [[ "$TYPE" = "PE" ]]; then
       #PAIRED SBATCH
       sbatch --array=0-`echo $(expr $(ls $INPUT_DIR/*_1.fastq.gz | wc -l) - 1 )` \
       --export=INPUT_DIR=`echo ${INPUT_DIR}`,OUTPUT_DIR=`echo ${OUTPUT_DIR}`,metaphlan_DB_DIR=`echo ${metaphlan_DB_DIR}`,metaphlan_INDEX=`echo ${metaphlan_INDEX}`,GTDB_PROFILE_DB=`echo ${GTDB_PROFILE_DB}` \
       --output=`echo ${LOG_DIR}`/arrayJob_%A_%a.out --job-name=Metaphlan_PE_`echo ${PROYECT}` Metaphlan4.0.6_PAIRED_array.batch
    elif [[ "$TYPE" = "SE" ]]; then
       #SINGLE SBATCH
       sbatch --array=0-`echo $(expr $(ls $INPUT_DIR/*.fastq.gz | grep -v "_1.fastq.gz" | grep -v "_2.fastq.gz" | wc -l) - 1 )` \
       --export=INPUT_DIR=`echo ${INPUT_DIR}`,OUTPUT_DIR=`echo ${OUTPUT_DIR}`,metaphlan_DB_DIR=`echo ${metaphlan_DB_DIR}`,metaphlan_INDEX=`echo ${metaphlan_INDEX}`,GTDB_PROFILE_DB=`echo ${GTDB_PROFILE_DB}` \
       --output=`echo ${LOG_DIR}`/arrayJob_%A_%a.out --job-name=Metaphlan_SE_`echo ${PROYECT}` Metaphlan4.0.6_SINGLE_array.batch
    else
       echo "Error! Permited options for 2nd parameter are PE or SE fastq files..."
    fi
else
    echo "Error! INPUT_DIR does not exist, check provided 1st parameter..."
fi
