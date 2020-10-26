# bash-7zip
Collection of functions for 7-zip.


## Installation

### hardware requirements

These scripts optimized for the following hardware...

**CPU:** Dual core processor

**RAM:** 4 GB RAM


### prerequisites

In order to use these functions, install the "bash-functions" repository first.
For more information follow the README.md guide there.
You can find the copy of this repo in a form of a subtree in the "dependencies-subtree"
folder or the URL of the original.

https://github.com/tamasviktorkrizsan/bash-functions


### Installation of this repository

Set a PATH environmental variable to the directory where you want store your library
files and copy the contents of the "function-library" folder to it.


## Usage

Copy the chosen script file from the "function-call" folder to the target folder
Edit it to your needs, and execute it.


## Functions

### decompress

`decompress "<archive name>";`

Extract archives.

- **default state:** when all parameters are empty, the script
will extract all archive file type files with 7z,zip,rar,iso extension.

- **feature:** auto-output folder: the function sets a output directory if there is
at least 2 folder or 1 file is in the root folder.


## Planned features

These features will be released in the future.

**compress_7z** - The goal of this function to maximize compression efficiency.
Optimized for high-end PC hardware for archival purposes.

**compress_zip** - The goal of this function to maximize compatibility, Optimized
for low-end PC hardware for email attachments.


## Developer notes

### code style

The code in this repository formatted according the guidelines of the Google Style Guides.
If you want to contribute to this project, then read the guide first.

https://google.github.io/styleguide/shellguide.html


## Sources

https://axelstudios.github.io/7z/#!/

https://sevenzip.osdn.jp/chm/cmdline/index.htm

https://www.howtogeek.com/200698/benchmarked-whats-the-best-file-compression-format/
