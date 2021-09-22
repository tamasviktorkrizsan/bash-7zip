#!/bin/bash
# Decompress archive files.
# Copyright (C) 2020-2021 Tamas Viktor Krizsan
# <https://github.com/tamasviktorkrizsan>
# License: GPL-3.0-or-later


### INCLUDES

source 7zip.sh

source count_archive.sh


### FUNCTIONS

#########################################################
# Extract compressed files.
# Arguments:
#   Input file/foldername or wildcard pattern
# Outputs:
#   Extract compressed files.
#########################################################
function decompress () {

## Input Parameters

declare usr_input="${1:-auto}";


## Constants

declare -r DEFAULT_INPUT="*.7z *.zip *.rar *.iso";

declare -r DECOMPRESS_SETTINGS="-y";

declare -r OUTPUT_FOLDER="OUTPUT";


## Variables

declare output_path;


## Processing & Executing Command


case $usr_input in

  "auto")

    for i in $DEFAULT_INPUT;
    do output_path=$(count_archive "$i" "$OUTPUT_FOLDER");
    output_log=$(replace_whitespace "${i%.*}");
    7z x $SZIP_SHARED_SETTINGS $DECOMPRESS_SETTINGS "$i" $output_path 2>&1 |\
    tee "$OUTPUT_FOLDER/$output_log.log";
    done;;


  *)

    for i in "$usr_input";
    do output_dir=$(count_archive "$i" "$OUTPUT_FOLDER");
    output_log=$(replace_whitespace "${i%.*}");
    7z x $SZIP_SHARED_SETTINGS $DECOMPRESS_SETTINGS "$i" $output_path 2>&1 |\
    tee "$OUTPUT_FOLDER/$output_log.log";
    done;;

esac;

}
