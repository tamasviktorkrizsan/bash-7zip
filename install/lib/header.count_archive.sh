#!/bin/bash
# This file contains the "count_archive" function.
# Copyright (C) 2020-2021 Tamas Viktor Krizsan
# <https://github.com/tamasviktorkrizsan>
# License: GPL-3.0-or-later


### FUNCTIONS

################################################################################
# Create a 7-zip command string, which creates a container folder if the archive
# has more than 1 file or folder in its root
# Arguments:
#   Input archive file or wildcard pattern, base output folder name
# Outputs:
#   echo output path
################################################################################
function count_archive () {


### INPUT PARAMETERS

declare usr_input="${1}";

declare output_folder="${2:-OUTPUT}"


### PROCESSING

declare dir_number file_number;

dir_number=$(7z l -slt "$usr_input" | grep 'Path = ' | grep -vEc '(/|7z|\.*$)');

file_number=$(7z l -slt "$usr_input" | grep 'Path = ' | grep -vE '(/|7z)'| grep -Ec '(\.*$)');


# set output directory if there is at least
# 2 folder or 2 file or 1 folder and 1 file is in it


declare extracted_folder output_path;

if [[ dir_number -gt 1 ]] || [[ file_number -gt 1 ]] || [[ dir_number -eq 1 ]] && [[ file_number -eq 1 ]];

  then extracted_folder=$(replace_whitespace "${usr_input%.*}");

  output_path="$output_folder/$extracted_folder/";

else output_path="$output_folder";

fi;


### OUTPUT

echo "$output_path";

}
