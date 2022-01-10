#!/bin/bash
# Get RAM usage data.
# Copyright (C) 2020-2021 Tamas Viktor Krizsan
# <https://github.com/tamasviktorkrizsan>
# License: GPL-3.0-or-later


### INCLUDES

source 7zip.sh


function get_free_ram () {


### PROCESSING

# get the amount of free ram

declare -i free_ram_kb;

free_ram_kb=$(cat /proc/meminfo | grep "MemFree:   " | awk -F ' ' '{print $2}');

# convert the result to megabytes
#TODO: might be good idea to keep on int precision to show less available memory

declare -i free_ram_mb;

free_ram_mb=$((free_ram_kb / 1024));

# echo the result

echo "$free_ram_mb";

}
