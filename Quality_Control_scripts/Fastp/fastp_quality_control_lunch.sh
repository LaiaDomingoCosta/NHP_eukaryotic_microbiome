#!/bin/bash

#Get parameters
PROYECT=$1
TYPE=$2
PG=$3
RAW=$4

#Set paths
DATASETS_DIR=/storage/tbc/gut_core/NHP_Metagenomes
LOG_DIR=/home/cardocos/TFM

#Check RAW parameter and get INPUT_DIR
if [[ "$RAW" = "D" ]] || [[ "$RAW" = "T" ]]; then
   #Set FOLDER for INPUT_DIR
   if [[ "$RAW" = "D" ]]; then
      FOLDER=Downloaded_FASTQs
   else
      FOLDER=Raw_FASTQs
   fi
   #Set INPUT_DIR and OUTPUT_DIR
   INPUT_DIR=${DATASETS_DIR}/${PROYECT}/FASTQs/${FOLDER}
   OUTPUT_DIR=${DATASETS_DIR}/${PROYECT}/FASTQs/fastp
   #Check if they exist
   if [ -d "$INPUT_DIR" ] && [ -d "$OUTPUT_DIR" ]; then
      #Lunch subscript depending on TYPE and PolyG(PG)
      if [[ "$TYPE" = "PE" ]] && [[ "$PG" = "N" ]]; then
         #Lunch Fastp PAIRED
         sbatch --export=INPUT_DIR=`echo ${INPUT_DIR}`,OUTPUT_DIR=`echo ${OUTPUT_DIR}` \
         --output=`echo ${LOG_DIR}`/fastp_qc_`echo ${PROYECT}`_`echo ${TYPE}`_`echo ${PG}`.log --job-name=Fastp-QC_`echo ${PROYECT}`_`echo ${TYPE}`_`echo ${PG}` fastp_qc_PAIRED.batch
      elif [[ "$TYPE" = "SE" ]] && [[ "$PG" = "N" ]]; then
         #Lunch Fastp SINGLE
         sbatch --export=INPUT_DIR=`echo ${INPUT_DIR}`,OUTPUT_DIR=`echo ${OUTPUT_DIR}` \
         --output=`echo ${LOG_DIR}`/fastp_qc_`echo ${PROYECT}`_`echo ${TYPE}`_`echo ${PG}`.log --job-name=Fastp-QC_`echo ${PROYECT}`_`echo ${TYPE}`_`echo ${PG}` fastp_qc_SINGLE.batch
      elif [[ "$TYPE" = "PE" ]] && [[ "$PG" = "Y" ]]; then
         #Lunch Fastp PAIRED (PolyG: NextSeq and NovaSeq)
         sbatch --export=INPUT_DIR=`echo ${INPUT_DIR}`,OUTPUT_DIR=`echo ${OUTPUT_DIR}` \
         --output=`echo ${LOG_DIR}`/fastp_qc_`echo ${PROYECT}`_`echo ${TYPE}`_`echo ${PG}`.log --job-name=Fastp-QC_`echo ${PROYECT}`_`echo ${TYPE}`_`echo ${PG}` fastp_qc_PAIRED_polyg.batch
      elif [[ "$TYPE" = "SE" ]] && [[ "$PG" = "Y" ]]; then
         #Lunch Fastp SINGLE (PolyG: NextSeq and NovaSeq)
         sbatch --export=INPUT_DIR=`echo ${INPUT_DIR}`,OUTPUT_DIR=`echo ${OUTPUT_DIR}` \
         --output=`echo ${LOG_DIR}`/fastp_qc_`echo ${PROYECT}`_`echo ${TYPE}`_`echo ${PG}`.log --job-name=Fastp-QC_`echo ${PROYECT}`_`echo ${TYPE}`_`echo ${PG}` fastp_qc_SINGLE_polyg.batch
      else
         echo "Error! Unpermited options for either TYPE(2nd parameter) or PG(3rd parameter):"
         echo "- Permited options for 2nd parameter are PE(PAIRED) or SE(SINGLE)"
         echo "- Permited options for 3rd parameter are Y(PolyG Yes) or N(PolyG No)"
      fi
   else
      echo "Error! INPUT_DIR or OUTPUT_DIR do not exist, check the PROYECT(1st parameter) value and/or your directories..."
   fi
else
   echo "Error! Permited options for RAW input folder(4th parameter) are D(Downloaded_FASTQs) or T(Treated Raw_FASTQs)..."
fi
