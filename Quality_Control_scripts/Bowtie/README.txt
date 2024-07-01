This is a two level script set-up: a lunching script bw2_primates_phix_decontamination.sh that lunches the corresponding slurm batch script depending on the provided parameters.

Positional parameters:
1) PROYECT(1st parameter): name of the folder dataset
2) TYPE(2nd parameter): type of FASTQ files, PAIRED(PE) or SINGLE(SE)

Example:

Basic usage:
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
bash bw2_primates_phix_decontamination.sh PROYECT TYPE
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Lunch Bowtie2 decontamination for PAIRED fastq files:
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
bash bw2_primates_phix_decontamination.sh PROYECT PE
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Lunch Bowtie2 decontamination for SINGLE fastq files:
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
bash bw2_primates_phix_decontamination.sh PROYECT SE
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Comments:

- All scripts need to be in the same folder.

- By default, the DATASETS_DIR=/storage/tbc/gut_core/NHP_Metagenome. If you have other path for your datasets change the variable in the bw2_human_phix_decontamination.sh script.

- By default, the LOG_DIR=/home/cardocos/TFM/logs. If you have other path for your datasets change the LOG_DIR variable in the bw2_primates_phix_decontamination.sh script.

- By default, the batch scripts are set to --qos=medium, --cpus-per-task=8, --mem=10gb, --time=7-00:00:00 . If you have memory or time problems change the parameters accordingly in the batch scripts.    

- By default, the BW2_DB=/home/cardocos/TFM/decontamination/NHP_decontamination. If you need to use a different reference change the variable in the bw2_human_phix_decontamination.sh script.
