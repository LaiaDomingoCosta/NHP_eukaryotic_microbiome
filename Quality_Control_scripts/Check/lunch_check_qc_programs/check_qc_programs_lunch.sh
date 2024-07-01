#!/bin/bash

#Get proyect parameter
PROYECT=$1
STEP=$2

#Set paths
DATASETS_DIR=/storage/tbc/gut_core/NHP_Metagenomes
LOG_DIR=/home/cardocos/TFM/logs/$PROYECT

#Get folder names based on provided STEP
if [[ "$STEP" = "rawD" ]]; then
   FOLDER=Downloaded_FASTQs
   QC_FOLDER=raw
elif [[ "$STEP" = "rawT" ]]; then
   FOLDER=Raw_FASTQs
   QC_FOLDER=raw
elif [[ "$STEP" = "fastp" ]]; then
   FOLDER=fastp
   QC_FOLDER=fastp
elif [[ "$STEP" = "bowtie" ]]; then
   FOLDER=bowtie
   QC_FOLDER=bowtie
else
   echo "Error! Permited options for STEP(2nd parameter) are rawD(Downloaded_FASTQs), rawT(Treated Raw_FASTQs), fastp or bowtie..."
fi

#Lunch programs if step is correct
if [[ "$STEP" = "rawD" ]] || [[ "$STEP" = "rawT" ]] || [[ "$STEP" = "fastp" ]] || [[ "$STEP" = "bowtie" ]]; then
   #Set paths
   INPUT_DIR=${DATASETS_DIR}/${PROYECT}/FASTQs/${FOLDER}
   OUTPUT_DIR_FASTQC=${DATASETS_DIR}/${PROYECT}/QC/FASTQC/${QC_FOLDER}
   OUTPUT_DIR_MULTI=${DATASETS_DIR}/${PROYECT}/QC/MULTIQC/${QC_FOLDER}
   
   #Check that INPUT_DIR, OUTPUT_DIR_FASTQC,  and OUTPUT_DIR_MULTI exist
   if [ -d "$INPUT_DIR" ] && [ -d "$OUTPUT_DIR_FASTQC" ] && [ -d "$OUTPUT_DIR_MULTI" ]; then
      #Lunch batch script
      sbatch --export=INPUT_DIR=`echo ${INPUT_DIR}`,OUTPUT_DIR_FASTQC=`echo ${OUTPUT_DIR_FASTQC}`,OUTPUT_DIR_MULTI=`echo ${OUTPUT_DIR_MULTI}` \
      --output=`echo ${LOG_DIR}`/check_qc_`echo ${PROYECT}`_`echo ${QC_FOLDER}`.log --job-name=Check_QC_`echo ${PROYECT}`_`echo ${QC_FOLDER}` check_qc_programs.batch 
   else
      echo "Error! INPUT_DIR, OUTPUT_DIR_FASTQC or OUTPUT_DIR_MULTI do not exist, check the PROYECT(1st parameter) value and/or your directories..."
  fi
fi
