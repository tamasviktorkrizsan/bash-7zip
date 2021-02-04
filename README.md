# bash-7zip
Bash library for 7-zip scripting.


## Installation

### Minimum hardware requirements

**CPU:** dual-core processor

**RAM:** 4 GB RAM


### Prerequisites

- **7-zip:** https://www.7-zip.org/download.html

Make sure, to set a **PATH** environmental variable that points to the folder,
which contains the software executable.


- **bash-functions:** https://github.com/tamasviktorkrizsan/bash-functions

(You can find the copy of this repository in the form of a subtree in the
`install/dependencies/subtree` path). Follow the installation steps in the local
README.md file.


### Installation of this repository

Set a **PATH** environmental variable to the directory where you want store your library
files and copy the contents of the `install/lib` path to it.


## Usage

Copy the chosen script file from the `call` folder to the target directory,
where you want to process your files, edit it to your needs, and execute it.


## Functions

### decompress

`decompress "<archive name>";`

Extract archive files.


#### Parameters

`"<archive name>"`

**possible values:** exact filename or wildcard pattern.

**default value:** `*.7z:*.zip:*.rar:*.iso`


#### Features

**auto-output folder:** the function sets a output directory if at least there is
2 folders or 1 file in the archive's root folder.



## Developer notes

### Code style

The code in this repository formatted according the guidelines of the **Google Style Guides**.
If you want to contribute to this project, then read the guide first.

https://google.github.io/styleguide/shellguide.html


## Sources

https://axelstudios.github.io/7z/#!/

https://sevenzip.osdn.jp/chm/cmdline/index.htm

https://www.howtogeek.com/200698/benchmarked-whats-the-best-file-compression-format/
