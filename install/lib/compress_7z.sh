#!/bin/bash
# Compress 7-zip archive files.
# Copyright (C) 2020-2022 Tamas Viktor Krizsan
# <https://github.com/tamasviktorkrizsan>
# License: GPL-3.0-or-later


### INCLUDES

source 7zip.sh


### FUNCTIONS

############################################################
# Compress  7z archives. Helper function.
# Used by the "compress_7z" function's loop structure.
# Arguments:
#  input file/folder or list file, output folder
# Outputs:
#  Compressed 7-zip archive + log in a subfolder
############################################################
function compress_7z_file () {

  ## Input Parameters

  declare usr_input="${1:-default}";

  declare usr_output_folder="${2:-OUTPUT}";


  ## Includes

  source memoryinfo.sh


  ## Constant Settings

  # scan lvl, CPU Threads, Compression Algorithm, Compression lvl, Word Size,
  # solid_block_size, output format

  declare -r -- CONSTANT_SETTINGS="-myx9 -mmt2 -m0=LZMA2 -mx9 -mfb273 -ms64g -t7z";


  ## Processing

  # Estimate dict_size from the amount of free RAM

  declare dict_size;

  dict_size=$(get_dictionary_size);

  declare settings="$SZIP_SHARED_SETTINGS $CONSTANT_SETTINGS $dict_size";


  declare -- output_path;

  output_path=$(handle_output "$usr_input" "$usr_output_folder");



  ## Output

  case $usr_input in

    *.list)
      7z a $settings "$output_path.7z" @"$usr_input" -scs$CHARSET 2>&1 |\
      tee "$output_path.log";;


     *)
      7z a $settings "$output_path.7z" "$usr_input" 2>&1 |\
      tee "$output_path.log";;

  esac

}

############################################################
# Compress  7z archives. End-user function.
# Arguments:
#  input file/folder or list file, output folder
# Outputs:
#  Compressed 7-zip archive + log in a subfolder
############################################################
function compress_7z () {

### INPUT PARAMETERS

declare usr_input="${1:-default}";

declare usr_output_folder="${2:-OUTPUT}";




case $usr_input in

  default | '*.txt')

    echo "process all list files in the current directory";

    for i in *.txt;
    do compress_7z_file "$usr_input" "$usr_output_folder";
    done;;


  *.txt)

    echo "process a list file";

    compress_7z_file "$usr_input" "$usr_output_folder";



   *)

    echo "compress file(s) or folder(s)";

    for i in "$usr_input";
    do compress_7z_file "$usr_input" "$usr_output_folder";
    done;;

esac

}
