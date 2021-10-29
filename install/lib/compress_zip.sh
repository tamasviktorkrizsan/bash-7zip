#!/bin/bash
# Compress archive files.
# Copyright (C) 2020-2021 Tamas Viktor Krizsan
# <https://github.com/tamasviktorkrizsan>
# License: GPL-3.0-or-later


### INCLUDES

source 7zip.sh


function compress_zip () {

### INPUT PARAMETERS

declare usr_input="${1}";

declare usr_output_folder="${2:-OUTPUT}";


### CONSTANT SETTINGS

# CPU Threads, Compression Algorithm, Compression lvl, Word Size, output format

declare -r -- COMPRESS_SETTINGS="-mmt2 -mm=Deflate -mx5 -mfb32 -tzip";


### PROCESSING

declare -- output;

declare -- input;


# convert relative path to absolute path
# (7-zip handles only absolute input path properly)

input=$(readlink -f "$usr_input");


# concat output path

output=$(handle_output "$usr_input" "$usr_output_folder");


# compressing

7z a $SZIP_SHARED_SETTINGS $COMPRESS_SETTINGS "$output.zip" "$input" 2>&1 |\
tee "$output.log";

}
