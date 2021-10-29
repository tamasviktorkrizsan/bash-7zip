#!/bin/bash
# This file contains 7-zip user and shared settings
# Copyright (C) 2020-2021 Tamas Viktor Krizsan
# <https://github.com/tamasviktorkrizsan>
# License: GPL-3.0-or-later


### INCLUDES

source bash.inc.sh


### USER SETTINGS

## Binary

#PATH=/cygdrive/c/Program Files/7-Zip:$PATH;


## Character Set

declare -xr -- CHARSET="UTF-8";


### SHARED SETTINGS

## Constants

declare -xr -- SZIP_SHARED_SETTINGS="-bb3";
