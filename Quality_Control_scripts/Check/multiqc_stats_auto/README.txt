The get_multiqc_stats.sh, stes the paths and calls the python script:

Positional parameters:
1) PROYECT(1st parameter): name of the folder dataset
2) PE_TREATMENT(2nd parameter): indicate how to treat PAIRED files counts, to count only once(S) or twice(D)

Examples:

Basic usage:
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
bash get_multiqc_stats.sh PROYECT PE_TREATMENT
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Get stats counting PAIRED 2X:
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
bash get_multiqc_stats.sh PROYECT D
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Get stats counting PAIRED only once:
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
bash get_multiqc_stats.sh PROYECT S
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Comments:

- All scripts need to be in the same folder.

- By default, the DATASETS_DIR=/storage/tbc/gut_core/CoreV2/Muestras_SPE. If you have other path for your datasets change the variable in the get_multiqc_stats.sh script.

