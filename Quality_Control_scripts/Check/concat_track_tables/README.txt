concat_track_tables.py
usage: concat_track_tables.py [-h] -i INPUT_DIRECTORY [-o OUTPUT_DIRECTORY]
                              [-op OUTPUT_NAME_PREFIX]

options:
  -h, --help            show this help message and exit
  -i INPUT_DIRECTORY, --input_directory INPUT_DIRECTORY
                        Input Directory. Indicate the path to Input Directory.
                        It must contains all track tables using ".tsv"
                        extension.
  -o OUTPUT_DIRECTORY, --output_directory OUTPUT_DIRECTORY
                        Output Directory (Optional). Indicate the path to the
                        Output Directory. Output files will be created in the
                        current directory if not indicated.
  -op OUTPUT_NAME_PREFIX, --output_name_prefix OUTPUT_NAME_PREFIX
                        Output Name Prefix (Optional). Indicate prefix name
                        
Examples:

Basic usage indicating the directory with all the track-tables per dataset to concatenate:
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
python3 concat_track_tables.py -i /home/user/Datasets/track_tables_dir 
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Save result table in specific dir:
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
python3 concat_track_tables.py -i /home/user/Datasets/track_tables_dir
                               -o /home/user/analysis/tables 
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Add prefix to output file(For example, add date):
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
python3 concat_track_tables.py -i /home/user/Datasets/track_tables_dir
                               -op 24Oct2023 
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Comments:
- The script will look for all the ".tsv" files in the directory and concatenate them. Be sure that all files are the same track-table type, taking into account PAIRED treatment (S or D) and track table type (counts or percentages). 
