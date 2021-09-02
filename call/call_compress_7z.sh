#!/bin/bash
# Call compress function.
# Copyright (C) 2020-2021 Tamas Viktor Krizsan
# <https://github.com/tamasviktorkrizsan>
# License: GPL-3.0-or-later


### INPUT PARAMETERS

input="*.txt";

output="";

RAM_gb="1";


### INCLUDES

source compress.sh


### FUNCTION CALL

compress_7z "$input" "$output" "$RAM_gb";

next_script "" "";
