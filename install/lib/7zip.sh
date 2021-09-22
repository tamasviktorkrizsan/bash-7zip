#!/bin/bash
# 7-zip shared settings.
# Copyright (C) 2020-2021 Tamas Viktor Krizsan
# <https://github.com/tamasviktorkrizsan>
# License: GPL-3.0-or-later


### INCLUDES

source bash.inc.sh


### BINARY

#PATH=/cygdrive/c/Program Files/7-Zip:$PATH;


### SHARED SETTINGS

## Constants

declare -xr -- SZIP_SHARED_SETTINGS="-bb3";
