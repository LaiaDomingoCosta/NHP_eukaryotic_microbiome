This is a two level script set-up: a lunching script Metaphlan4.0.6_lunch_array.sh that lunches the corresponding slurm batch script depending on the provided parameters.

Positional parameters:
1) PROYECT(1st parameter): name of the folder dataset
2) TYPE(2nd parameter): type of FASTQ files, PAIRED(PE) or SINGLE(SE)

Example:

Basic usage:
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
bash Metaphlan4.0.6_lunch_array.sh PROYECT TYPE
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Lunch Metaphlan4.0.6 for PAIRED files:
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
bash Metaphlan4.0.6_lunch_array.sh PROYECT PE
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Lunch Metaphlan4.0.6 for SINGLE files:
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
bash Metaphlan4.0.6_lunch_array.sh PROYECT SE
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Comments:

- All scripts need to be in the same folder.

- By default, the DATASETS_DIR=/storage/tbc/gut_core/CoreV2/Muestras_SPE. If you have other path for your datasets change the variable in the Metaphlan4.0.6_lunch_array.sh script.

- By default, the LOG_DIR=/home/sapies/logs/metaphlan4.0.6_Oct22/${PROYECT}. If you have other path for your datasets change the LOG_DIR variable in the Metaphlan4.0.6_lunch_array.sh script.

- By default, the batch scripts are set to --qos=medium, --cpus-per-task=6, --mem=20gb, --time=7-00:00:00 . If you have memory or time problems change the parameters accordingly in the batch scripts.   
