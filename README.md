# bash-7zip
Collection of functions for 7-zip.


## Installation

### Minimum hardware requirements

**CPU:** dual-core processor

**RAM:** 4 GB RAM


### Prerequisites

In order to use these functions, install the "bash-functions" repository first.
For more information follow the README.md guide there.
You can find the copy of this repo in the form of a subtree in the "install/dependencies/subtree"
path or through this URL.

https://github.com/tamasviktorkrizsan/bash-functions


### Installation of this repository

Set a PATH environmental variable to the directory where you want store your library
files and copy the contents of the "install/lib" folder to it.


## Usage

Copy the chosen script file from the "call" folder to the target directory,
where you want to process your files, edit it to your needs, and execute it.


## Functions

### decompress

`decompress "<archive name>";`

Extract archive files.

- **default state:** when all parameters are empty, the script
will extract all archive file type files with the following extensions:  
7z, zip, rar, iso

- **feature:** auto-output folder: the function sets a output directory if at least there is
2 folders or 1 file in the archive's root folder.


## Developer notes

### Code style

The code in this repository formatted according the guidelines of the Google Style Guides.
If you want to contribute to this project, then read the guide first.

https://google.github.io/styleguide/shellguide.html


## Sources

https://axelstudios.github.io/7z/#!/

https://sevenzip.osdn.jp/chm/cmdline/index.htm

https://www.howtogeek.com/200698/benchmarked-whats-the-best-file-compression-format/
