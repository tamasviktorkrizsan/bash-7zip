#!/bin/bash
# 7-zip helper functions for getting RAM usage information
# Copyright (C) 2020-2022 Tamas Viktor Krizsan
# <https://github.com/tamasviktorkrizsan>
# License: GPL-3.0-or-later


### FUNCTIONS

################################################################
# Get the amount of free RAM in Megabytes (with int precision)
# Outputs:
#  echo the amount of free RAM (int)
################################################################
function get_free_ram () {


### PROCESSING

# get the amount of free ram

declare -i free_ram_kb;

free_ram_kb=$(cat /proc/meminfo | grep "MemFree:   " | awk -F ' ' '{print $2}');

# convert the result to megabytes

declare -i free_ram_mb;

free_ram_mb=$((free_ram_kb / 1024));

# echo the result

echo "$free_ram_mb";

}


################################################################################
# based on the amount of free RAM, set the appropriate dictionary setting for
# 7z compression
# Outputs:
#  echo the dictionary setting (string)
################################################################################
function get_dictionary_size () {


### PROCESSING

# get the amount of free RAM 

declare -i free_ram;

free_ram=$(get_free_ram);


# estimate dictionary size from the amount of free RAM

declare dict_size;

if ((free_ram <= 708));
  then dict_size="-md64k";

elif ((709 <= free_ram && free_ram <= 1380));
  then dict_size="-md64m";

elif ((1381 <= free_ram && free_ram <= 2724));
  then dict_size="-md128m";

elif ((2725 <= free_ram && free_ram <= 5412));
  then dict_size="-md256m";

elif ((5413 <= free_ram && free_ram <= 10788));
  then dict_size="-md512m";

elif ((10789 <= free_ram && free_ram <= 16676));
  then dict_size="-md1024m";

elif ((16677 <= free_ram));
  then dict_size="-md1536m";

else echo "ERROR! Not a valid parameter!";

fi


### RETURN

echo "$dict_size";

}
