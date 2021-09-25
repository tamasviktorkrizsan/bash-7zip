#!/bin/bash
# Compress archive files.
# Copyright (C) 2020-2021 Tamas Viktor Krizsan
# <https://github.com/tamasviktorkrizsan>
# License: GPL-3.0-or-later


### INCLUDES

source 7zip.sh


function compress_7z () {

### INPUT PARAMETERS

declare usr_input="${1}";

declare usr_output_folder="${2}"

declare usr_RAM="${3:-1}";



### CONSTANT SETTINGS

# scan, process, CCodec, clvl, solid_block_size, output format

declare -r -- CONSTANT_SETTINGS="-myx9 -mmt2 -m0=LZMA2 -mx9 -mfb273 -ms64g -t7z";


### PROCESSING

declare dictionary_size;

case $usr_RAM in


  "1")

    dictionary_size="-md64m";;


  "2")

    dictionary_size="-md128m";;


  "4")

    dictionary_size="-md256m";;


  "8")

    dictionary_size="-md512m";;


  "16")

    dictionary_size="-md1024m";;


  "32")

    dictionary_size="-md1536m";;


  *)

    echo "ERROR! Not a valid RAM size! Check the RAM_gb parameter!";;


esac

set -- "$dictionary_size";

declare compress_settings="$CONSTANT_SETTINGS $dictionary_size";


declare -- output;

case $usr_input in

  "*.txt")

       for i in *.txt;
       do output=$(handle_output "$i" "");
       7z a $SZIP_SHARED_SETTINGS $compress_settings "$output.7z" @"$i" 2>&1 |\
       tee "$output.log";
       done;;


  *.txt)

    output=$(handle_output "$usr_input" "");
    7z a $SZIP_SHARED_SETTINGS $compress_settings "$output.7z" @"$usr_input" 2>&1 |\
    tee "$output.log";;


   *)

     output=$(handle_output "$usr_input" "");
     7z a $SZIP_SHARED_SETTINGS $compress_settings "$output" "$usr_input" 2>&1 |\
     tee "$output.log";;

esac

}
