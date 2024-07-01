generate_configfile.py
usage: generate_configfile.py [-h] -i FASTQ_DIRECTORY -l {true,false} -r READ_LENGTH -o1 OUTPUT_DIR_EUKDETECT [-o2 OUTPUT_DIR_CONFIGFILE]

options:
  -h, --help            show this help message and exit
  -i FASTQ_DIRECTORY, --fastq_directory FASTQ_DIRECTORY
                        Bowtie Samples Data Path. Indicate rute to processed Fastqs directory.
  -l {true,false}, --library_layout {true,false}
                        Library Layout. Indicate whether reads are PAIRED (true) or SINGLE (false).
  -r READ_LENGTH, --read_length READ_LENGTH
                        Read Length. Indicate length of the reads.
  -o1 OUTPUT_DIR_EUKDETECT, --output_dir_eukdetect OUTPUT_DIR_EUKDETECT
                        Output Directory EukDetect Analysis. Indicate the path to the output directory for EukDetect analyses.
  -o2 OUTPUT_DIR_CONFIGFILE, --output_dir_configfile OUTPUT_DIR_CONFIGFILE
                        Output Directory Configfile (Optional). Indicate the path to the output directory of configfle. Output file will be created in the current directory if not indicated.
                        

Examples:

Basic usage, in case of PAIRED samples:
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
python3 generate_configfile.py	-i /home/user/Datasets/PROJECT/Bowtie
                              	-l true
                              	-r 75
                              	-o1 /home/user/Datasets/PROJECT/Euk_output
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

In case of SINGLE samples:
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
python3 generate_configfile.py	-i /home/user/Datasets/PROJECT/Bowtie 
                              	-l false
                              	-r 75
                              	-o1 /home/user/Datasets/PROJECT/Euk_output
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Add output directory to save the configfile (OPTIONAL):
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
python3 generate_configfile.py	-i /home/user/Datasets/PROJECT/Bowtie
                              	-l true
                              	-r 75
                              	-o1 /home/user/Datasets/PROJECT/Euk_output
                              	-o2 /home/user/Datasets/PROJECT/Euk_output/configfile
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Comments:

- This script builds the configfile needed to run EukDetect through snakemake.

- In case there are both single and paired samples in the same project this script must be executed twice, one for each type of Library Layout.

- By default, the read length is set to 75 base pairs.
