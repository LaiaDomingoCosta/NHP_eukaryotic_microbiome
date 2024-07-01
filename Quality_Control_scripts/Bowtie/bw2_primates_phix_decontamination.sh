#!/bin/bash

#Set parameters
PROYECT=$1
TYPE=$2

#Set paths
LOG_DIR=/home/cardocos/TFM
DATASETS_DIR=/storage/tbc/gut_core/NHP_Metagenomes
INPUT_DIR=${DATASETS_DIR}/${PROYECT}/FASTQs/fastp
OUTPUT_DIR=${DATASETS_DIR}/${PROYECT}/FASTQs/bowtie
BW2_DB=/home/cardocos/TFM/decontamination/NHP_decontamination

#Check if directories exist
if [ -d "$INPUT_DIR" ] && [ -d "$OUTPUT_DIR" ]; then
   if [[ "$TYPE" = "PE" ]]; then
      #Lunch Bowtie2 for PAIRED
      sbatch --export=INPUT_DIR=`echo ${INPUT_DIR}`,OUTPUT_DIR=`echo ${OUTPUT_DIR}`,BW2_DB=`echo ${BW2_DB}` \
      --output=`echo ${LOG_DIR}`/bw2_decontamination_`echo ${PROYECT}`_`echo ${TYPE}`.log --job-name=BW2-Human-Phix_`echo ${PROYECT}`_`echo ${TYPE}` QC_BW2_HumanPhix_PAIRED.batch
   elif [[ "$TYPE" = "SE" ]]; then
      #Lunch Bowtie2 for SINGLE
      sbatch --export=INPUT_DIR=`echo ${INPUT_DIR}`,OUTPUT_DIR=`echo ${OUTPUT_DIR}`,BW2_DB=`echo ${BW2_DB}` \
      --output=`echo ${LOG_DIR}`/bw2_decontamination_`echo ${PROYECT}`_`echo ${TYPE}`.log --job-name=BW2-Human-Phix_`echo ${PROYECT}`_`echo ${TYPE}` QC_BW2_HumanPhix_SINGLE.batch
   else
      echo "Error! permited options for TYPE(2nd parameter) are PE(PAIRED) or SE(SINGLE)..."
   fi
else
   echo "Error! INPUT_DIR or OUTPUT_DIR do not exist, check the PROYECT(1st parameter) value and/or your directories..."
fi
