multiqc_stats_auto.py
usage: multiqc_stats_auto.py [-h] -i1 RAW_FILE_PATH -i2 PROCESSED_FILES_PATHS [PROCESSED_FILES_PATHS ...] -i2_names PROCESSED_FILES_NAMES [PROCESSED_FILES_NAMES ...] [-sep SAMPLE_NAME_SEP]
                             [-n_sep SAMPLE_NAME_SEP_APPEREANCE] [-p FASTQ_PATTERN] [-r1 R1_PATTERN] [-r2 R2_PATTERN] [-o OUTPUT_DIRECTORY] [-op OUTPUT_NAME_PREFIX] [-pt {S,D}] [-f] [-t FILTER_FILE]

options:
  -h, --help            show this help message and exit
  -i1 RAW_FILE_PATH, --raw_file_path RAW_FILE_PATH
                        Raw Samples Data Path. Indicate rute to multiqc_data directory.
  -i2 PROCESSED_FILES_PATHS [PROCESSED_FILES_PATHS ...], --processed_files_paths PROCESSED_FILES_PATHS [PROCESSED_FILES_PATHS ...]
                        Processed Samples Data Paths. Indicate rute to multiqc_data directories. Use like: -i2 path1/multiqc_data/ path2/multiqc_data/ path3/multiqc_data/ [...]
  -i2_names PROCESSED_FILES_NAMES [PROCESSED_FILES_NAMES ...], --processed_files_names PROCESSED_FILES_NAMES [PROCESSED_FILES_NAMES ...]
                        Processed Samples Data Names. Indicate the corresponding names for the processing steps. Use like: -i2_names name1 name2 name3 [...]. Must be in the same order than -i2 parameter.
  -sep SAMPLE_NAME_SEP, --sample_name_sep SAMPLE_NAME_SEP
                        Sample Name separator (Optional). Samples names will by separated by the provided character [Default="_"].
  -n_sep SAMPLE_NAME_SEP_APPEREANCE, --sample_name_sep_appereance SAMPLE_NAME_SEP_APPEREANCE
                        Sample Name separator Appereance (Optional). Indicate by which appereance of the separator the file name can be divided in sample_name + rest [Default=1 appereance].
  -p FASTQ_PATTERN, --fastq_pattern FASTQ_PATTERN
                        Fastq File Extension (Optional) [Default:".fastq.gz"]. Indicate the extension to identify Fastq files.
  -r1 R1_PATTERN, --r1_pattern R1_PATTERN
                        R1 File Pattern (Optional) [Default:"_1.fastq.gz"]. Indicate the pattern to identify R1 PAIRED Fastq files.
  -r2 R2_PATTERN, --r2_pattern R2_PATTERN
                        R2 File Pattern (Optional) [Default:"_2.fastq.gz"]. Indicate the pattern to identify R2 PAIRED Fastq files.
  -o OUTPUT_DIRECTORY, --output_directory OUTPUT_DIRECTORY
                        Output Directory (Optional). Indicate the path to the Output Directory. Output files will be created in the current directory if not indicated.
  -op OUTPUT_NAME_PREFIX, --output_name_prefix OUTPUT_NAME_PREFIX
                        Output Name Prefix (Optional). Indicate prefix name for the output files. 
  -pt {S,D}, --paired_treatment {S,D}
                        Paired Treatment (Optional) [Default:"S"]. Indicate how to treat PAIRED files counts, to count only once(S) or twice(D).
  -f, --filter_mode     Filter Mode (Optional). If indicated, it will enable Filter Samples Mode.
  -t FILTER_FILE, --filter_file FILTER_FILE
                        Filter File [Required for Filter Mode]. Indicate the path to the Filter File [expected format: TXT file]. Each line in the Filter File will correspond to a sample name that you wish to filter out.

Examples:

Basic usage indicate MULTIQC data for raw fastqs and other QC steps:
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
python3 multiqc_stats_auto.py -i1 /home/user/Datasets/PROYECT/MULTIQC/raw/multiqc_data/ 
                              -i2 /home/user/Datasets/PROYECT/MULTIQC/fastp/multiqc_data/ /home/user/Datasets/PROYECT/MULTIQC/bowtie/multiqc_data/ 
                              -i2_names fastp bowtie
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Add prefix to the output files:
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
python3 multiqc_stats_auto.py -i1 /home/user/Datasets/PROYECT/MULTIQC/raw/multiqc_data/ 
                              -i2 /home/user/Datasets/PROYECT/MULTIQC/fastp/multiqc_data/ /home/user/Datasets/PROYECT/MULTIQC/bowtie/multiqc_data/ 
                              -i2_names fastp bowtie
                              -op DATASET_NAME
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Save output files in directory:
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
python3 multiqc_stats_auto.py -i1 /home/user/Datasets/PROYECT/MULTIQC/raw/multiqc_data/ 
                              -i2 /home/user/Datasets/PROYECT/MULTIQC/fastp/multiqc_data/ /home/user/Datasets/PROYECT/MULTIQC/bowtie/multiqc_data/ 
                              -i2_names fastp bowtie
                              -o OUTPUT_DIR
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

PAIRED reads counted as 2X (by default PAIRED reads are counted only one):
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
python3 multiqc_stats_auto.py -i1 /home/user/Datasets/PROYECT/MULTIQC/raw/multiqc_data/ 
                              -i2 /home/user/Datasets/PROYECT/MULTIQC/fastp/multiqc_data/ /home/user/Datasets/PROYECT/MULTIQC/bowtie/multiqc_data/ 
                              -i2_names fastp bowtie -pt D
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Use different PAIRED files extension patterns:
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
python3 multiqc_stats_auto.py -i1 /home/user/Datasets/PROYECT/MULTIQC/raw/multiqc_data/ 
                              -i2 /home/user/Datasets/PROYECT/MULTIQC/fastp/multiqc_data/ /home/user/Datasets/PROYECT/MULTIQC/bowtie/multiqc_data/ 
                              -i2_names fastp bowtie
                              -r1 _R1.fastq.gz
                              -r2 _R2.fastq.gz
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Use different separator and appereance (using "." instead of "_" as separator and seacrhing for 2nd appereance instead of the default 1st):
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
python3 multiqc_stats_auto.py -i1 /home/user/Datasets/PROYECT/MULTIQC/raw/multiqc_data/ 
                              -i2 /home/user/Datasets/PROYECT/MULTIQC/fastp/multiqc_data/ /home/user/Datasets/PROYECT/MULTIQC/bowtie/multiqc_data/ 
                              -i2_names fastp bowtie
                              -sep .
                              -n_sep 2
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Filter out the provided sample names in a TXT filterfile (one sample name per line):
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
python3 multiqc_stats_auto.py -i1 /home/user/Datasets/PROYECT/MULTIQC/raw/multiqc_data/ 
                              -i2 /home/user/Datasets/PROYECT/MULTIQC/fastp/multiqc_data/ /home/user/Datasets/PROYECT/MULTIQC/bowtie/multiqc_data/ 
                              -i2_names fastp bowtie
                              -f -t FILTER_FILE.TXT
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Comments:

- The parameter "-i2_names" must be used indicating the names of the QC steps in the same order of the related parameter "-i2".

- By default, the program counts only the R1 files to calculate stats(-pt S), but some tools use all reads counting both R1 and R2. For this cases, we use the parameter "-pt D" to indicate to doble the number of reads associated to the sample. 

- Take into consideration that the fastq and PAIRED files patterns must be the same for the different QC steps. 

- In our case, we work with the default PAIRED files patterns used by ENA "-r1 _1.fastq.gz" and "-r2 _2.fastq.gz". We can indicate other PAIRED and fastq patterns, but is not recommended.   

- With respect to the separators, the expected in our case are(this are the ones expected by default and the ones that must be used):
  raw: SAMPLENAME_1.fastq.gz SAMPLENAME_2.fastq.gz SAMPLENAME.fastq.gz
  fastp: SAMPLENAME_qc_1.fastq.gz SAMPLENAME_qc_2.fastq.gz SAMPLENAME_qc.fastq.gz
  bowtie: SAMPLENAME_qc_fHP_1.fastq.gz SAMPLENAME_qc_fHP_2.fastq.gz SAMPLENAME_qc_fHP.fastq.gz  

- We can use the filter mode to remove samples that are not going to be used in the analysis and recalculate stats. If a FILTER_FILE is provided, but filter mode is not indicated this will be ignored.  

