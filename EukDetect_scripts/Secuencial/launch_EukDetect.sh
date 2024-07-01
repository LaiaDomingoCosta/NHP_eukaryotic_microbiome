#!/bin/bash

#Get parameters
PROYECT=$1
TYPE=$2
LENGTH=75

#Set paths
DATASETS_DIR=/storage/tbc/gut_core/CoreV2/Muestras_SPE
LOG_DIR=/storage/tbc/gut_core/NHP_Metagenomes/logs/Eukdetect_Human/
EUK_DB=/storage/tbc/gut_core/NHP_Metagenomes/eukdb
EUK_DIR=/home/cardocos/TFM/EukDetect
SNAKEFILE=/home/cardocos/TFM/5EukDetect/Secuencial/eukdetect_eukfrac.rules

#Set INPUT_DIR and OUTPUT_DIR
INPUT_DIR=${DATASETS_DIR}/${PROYECT}/FASTQs/bowtie
OUTPUT_DIR=${DATASETS_DIR}/${PROYECT}/EukDetect

#Check INPUT_DIR exits
if [ -d "$INPUT_DIR" ]; then
    #Create output dirs
    ##Create OUTPUT_DIR if not already exist
    if [ ! -d "$OUTPUT_DIR" ]; then
       mkdir ${OUTPUT_DIR}
    fi
    if [ ! -d "$OUTPUT_DIR/Euk_output" ]; then
       mkdir ${OUTPUT_DIR}/Euk_output
    fi

    ##Create LOG_DIR if not already exist
    if [ ! -d "$LOG_DIR" ]; then
       mkdir ${LOG_DIR}
    fi
    #Lunch subscript
	if [[ "$TYPE" = "SE" ]] || [[ "$TYPE" = "PE" ]]; then
		sbatch --export=INPUT_DIR=`echo ${INPUT_DIR}`,OUTPUT_DIR=`echo ${OUTPUT_DIR}`,EUK_DB=`echo ${EUK_DB}`,EUK_DIR=`echo ${EUK_DIR}`,TYPE=`echo ${TYPE}`,LENGTH=`echo ${LENGTH}`,SNAKEFILE=`echo ${SNAKEFILE}` \
	 	--output=`echo ${LOG_DIR}``echo ${PROYECT}`_`echo ${TYPE}`_.log --job-name=EukDetect_`echo ${PROYECT}`_`echo ${TYPE}` EukDetect.batch
	else
		echo "Error! Unpermited options for TYPE(2nd parameter)."
		echo "Permited options for 2nd parameter are PE(PAIRED) or SE(SINGLE)"
	fi
	else
		echo "Error! INPUT_DIR or OUTPUT_DIR do not exist, check the PROYECT(1st parameter) value and/or your directories..."
fi
