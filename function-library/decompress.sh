#!/bin/bash
# Decompress archive files.
# Copyright (C) 2020 Tamas Viktor Krizsan
# <https://github.com/tamasviktorkrizsan>
# License: GPL-3.0-or-later


### INCLUDES

source 7zip.sh


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

local user_input_file="${1:-*.7z:*.zip:*.rar:*.iso}";


## Constants

IFS=':';

local -r DECOMPRESS_SETTINGS="-y";


## Variables

local archive_folder_number archive_file_number output_folder output_directory;


## Processing & Executing Command

for i in $user_input_file;


# count files and foldes

do archive_folder_number=$(7z l -slt "$i" | grep 'Path = ' | grep -vEc '(/|7z|\.*$)');

archive_file_number=$(7z l -slt "$i" | grep 'Path = ' | grep -vE '(/|7z)'| grep -Ec '(\.*$)');


# set output directory if there is at least 2 folder or 1 file is in it

if [[ archive_folder_number -gt 1 ]] || [[ archive_file_number -gt 0 ]];

  then output_folder=$(replace_whitespace "${i%.*}");

  output_directory="-o$output_folder";

  else output_directory='';
fi;


# decompress files

7z x $SEVENZIP_SHARED_SETTINGS $DECOMPRESS_SETTINGS "$i" $output_directory 2>&1 |\
tee "${i%.*}"_$SEVENZIP_LOG_SUFFIX;
done;

}
