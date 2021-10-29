#!/bin/bash
# Call compress zip function.
# Copyright (C) 2020-2021 Tamas Viktor Krizsan
# <https://github.com/tamasviktorkrizsan>
# License: GPL-3.0-or-later


### INPUT PARAMETERS

input="test";

output_folder="";


### INCLUDES

source compress_zip.sh


### FUNCTION CALL

compress_zip "$input" "$output_folder";

next_script "" "";
