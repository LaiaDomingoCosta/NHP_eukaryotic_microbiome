pres-abs_matrix_and_taxonomy.py
usage: pres-abs_matrix_and_taxonomy.py [-h] -i ROOT_PATH -e EUK_DIR_NAME -r {genus,species} [-p OUTPUT_NAME_PREFIX] [-o OUTPUT_DIR]

options:
  -h, --help            show this help message and exit
  -i ROOT_PATH, --root_path ROOT_PATH
                        Root Path. Root directory from which you want to start looking for all EukDetect outputs.Make sure the EukDetect outputs are inside that directory.
  -e EUK_DIR_NAME, --euk_dir_name EUK_DIR_NAME
                        EukDetect Ouput Directory Name. Indicate the name of directory where the EukDetect outputs are saved.
  -r {genus,species}, --rank {genus,species}
                        Taxonomic Rank (genus or species). Specify one of the two allowed taxonomic ranges for which you want to obtain results.
  -p OUTPUT_NAME_PREFIX, --output_name_prefix OUTPUT_NAME_PREFIX
                        Output Name Prefix (Optional). Indicate prefix name for the output files.
  -o OUTPUT_DIR, --output_dir OUTPUT_DIR
                        Output Directory (Optional). Indicate the path to the output directory. Output files will be created in the current directory if not indicated.


Examples:

Basic usage, in case taxonomy is required at genus level:
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
python3 pres-abs_matrix_and_taxonomy.py -i /home/user/Datasets/PROJECT
                              		-e /home/user/Datasets/PROJECT/Euk_output
                              		-r genus
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Basic usage, in case taxonomy is required at species level:
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
python3 pres-abs_matrix_and_taxonomy.py -i /home/user/Datasets/PROJECT
                              		-e /home/user/Datasets/PROJECT/Euk_output
                              		-r species
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Add prefix to the output files (OPTIONAL):
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
python3 pres-abs_matrix_and_taxonomy.py -i /home/user/Datasets/PROJECT
                              		-e /home/user/Datasets/PROJECT/Euk_output
                              		-r genus
                              		-p alldatasets
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Specify the path to save the tables (OPTIONAL):
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
python3 pres-abs_matrix_and_taxonomy.py -i /home/user/Datasets/PROJECT
                              		-e /home/user/Datasets/PROJECT/Euk_output
                              		-r genus
                              		-p PROJECT
                              		-o /home/user/Datasets/PROJECT/Euk_final_tables
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Comments:

- This program search all output files of EukDetect that ends in "hits_eukfrac.txt" and generate the presence-absence and taxonomy matrix both at gender and species level.

- The "i" parameter must be the absolute path to start searching the files, if a project subdirectory is entered it will not search over that path.

- The prefix option "p" can be used to name the final tables depending on whether they are processed as a single project or as a set of these.
