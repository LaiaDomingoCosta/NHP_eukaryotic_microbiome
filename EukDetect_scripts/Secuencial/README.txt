This is a lunching script launch_EukDetect.sh that lunches the corresponding slurm batch script depending on the provided parameters.

Positional parameters:
1) PROYECT(1st parameter): name of the folder dataset
2) TYPE(2nd parameter): type of FASTQ files, PAIRED(PE) or SINGLE(SE)

Example:

Basic usage:
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
bash launch_EukDetect.sh PROYECT TYPE
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Lunch EukDetect for PAIRED files:
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
bash launch_EukDetect.sh PROYECT PE
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Lunch EukDetect for SINGLE files:
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
bash launch_EukDetect.sh PROYECT SE
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Comments:

- All scripts need to be in the same folder.

- By default, the LENGTH=75. If you have other read length change the variable in the launch_EukDetect.sh script.

- By default, the DATASETS_DIR=/storage/tbc/gut_core/NHP_Metagenomes. If you have other path for your datasets change the variable in the launch_EukDetect.sh script.

- By default, the LOG_DIR=/home/cardocos/TFM/logs/${PROYECT}/EukDetect. If you have other path for your logs change the LOG_DIR variable in the launch_EukDetect.sh script.

- By default, the EUK_DB=/storage/tbc/gut_core/NHP_Metagenomes/eukdb. If you have other path for your EukDetect database change the variable in the launch_EukDetect.sh script.

- By default, the EUK_DIR=/home/cardocos/TFM/EukDetect. If you have other path for your EukDetect installation change the variable in the launch_EukDetect.sh script.

- By default, the SNAKEFILE=/home/cardocos/TFM/5EukDetect/Secuencial/eukdetect_eukfrac.rules. If you have other path for your snakefile change the variable in the launch_EukDetect.sh script.

- By default, the batch scripts are set to --qos=medium, --cpus-per-task=8, --mem=35gb, --time=7-00:00:00 . If you have memory or time problems change the parameters accordingly in the batch scripts.   

