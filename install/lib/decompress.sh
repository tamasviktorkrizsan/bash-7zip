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

declare usr_input="${1:-default}";

declare usr_output_folder="${2:-OUTPUT}";


## Constants

declare -r DEFAULT_INPUT="*.7z *.zip *.rar *.iso";

declare -r DECOMPRESS_SETTINGS="-y";


## Variables

declare output_path;


## Processing & Executing Command

case $usr_input in

  "default")

    # extract all  of archive format

    for i in $DEFAULT_INPUT;
    do output=$(count_archive "$i" "$usr_output_folder");
    output_log=$(replace_whitespace "${i%.*}");
    7z x $SZIP_SHARED_SETTINGS $DECOMPRESS_SETTINGS "$i" -o$output 2>&1 |\
    tee "$usr_output_folder/$output_log.log";
    done;;


  *)

    for i in "$usr_input";
    do output=$(count_archive "$i" "$usr_output_folder");
    output_log=$(replace_whitespace "${i%.*}");
    7z x $SZIP_SHARED_SETTINGS $DECOMPRESS_SETTINGS "$i" -o$output 2>&1 |\
    tee "$usr_output_folder/$output_log.log";
    done;;

esac;

}
