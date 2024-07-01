This is a two scripts set-up: the check_qc_programs_lunch.sh is the one that gets the parameters and lunches the check_qc_programs.batch.

Positional parameters:
1) PROYECT(1st parameter): name of the folder dataset
2) STEP(2nd parameter): indicate the quality step, Downloaded_FASTQs raw files(rawD), Treated Raw_FASTQs files(rawT), fastp files(fastp) or bowtie files(bowtie)

Example:

Basic usage:
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
bash set_dataset_directory.sh PROYECT STEP
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Lunch FastQC and MultiQC for Raw files in Downloaded_FASTQs folder:
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
bash set_dataset_directory.sh PROYECT rawD
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Lunch FastQC and MultiQC for Raw files in Treated Raw_FASTQs folder:
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
bash set_dataset_directory.sh PROYECT rawT
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Lunch FastQC and MultiQC for fastp files in fastp folder:
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
bash set_dataset_directory.sh PROYECT fastp
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Lunch FastQC and MultiQC for bowtie files in bowtie folder:
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
bash set_dataset_directory.sh PROYECT bowtie
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Comments:

- Both scripts need to be in the same folder.

- By default, the DATASETS_DIR=/storage/tbc/gut_core/CoreV2/Muestras_SPE. If you have other path for your datasets change the variable in the check_qc_programs_lunch.sh script.

- By default, the LOG_DIR=/home/sapies/logs/QC/check_stats. If you have other path for your datasets change the LOG_DIR variable in the check_qc_programs_lunch.sh script.

- By default, the check_qc_programs.batch is set to --qos=short, --cpus-per-task=8, --mem=6gb, --time=1-00:00:00 . If you have memory or time problems change the parameters accordingly in the  check_qc_programs.batch script.    
