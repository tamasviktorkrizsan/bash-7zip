#!/bin/bash
# Decompress archive files.
# Copyright (C) 2020-2021 Tamas Viktor Krizsan
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

local usr_input_file="${1:-*.7z:*.zip:*.rar:*.iso}";


## Constants

IFS=':';

local -r DECOMPRESS_SETTINGS="-y";


## Variables

local archive_folder_number;

local archive_file_number;

local output_folder;

local output_dir;


## Processing & Executing Command

for i in $usr_input_file;


# count files and folders

do archive_folder_number=$(7z l -slt "$i" | grep 'Path = ' | grep -vEc '(/|7z|\.*$)');

archive_file_number=$(7z l -slt "$i" | grep 'Path = ' | grep -vE '(/|7z)'| grep -Ec '(\.*$)');


# set output directory if there is at least 2 folder or 1 file is in it

if [[ archive_folder_number -gt 1 ]] || [[ archive_file_number -gt 0 ]];

  then output_folder=$(replace_whitespace "${i%.*}");

  output_dir="-o$output_folder";

  else output_directory='';
fi;


# decompress files

7z x $SEVENZIP_SHARED_SETTINGS $DECOMPRESS_SETTINGS "$i" $output_dir 2>&1 |\
tee "${i%.*}"_$SEVENZIP_LOG_SUFFIX;
done;

}
