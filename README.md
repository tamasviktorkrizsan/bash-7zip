# bash-7zip
Bash library for 7-zip scripting.


## Installation

### Minimum hardware requirements

**CPU:** dual-core processor

**RAM:** 2 GB RAM


### Prerequisites

- **7-zip:** https://www.7-zip.org/download.html

- **bash-functions:** https://github.com/tamasviktorkrizsan/bash-functions


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

**auto output folder:** depending from the archive's root folder
structure, the file extraction can make a mess in the the target folder.
This feature was made to prevent this. If the number of files/folders
more than 1 OR there is 1 file and 1 folder in the archive's root than a container folder
(named after the archive) will be made for the output.


### compress_zip

Compress files into a zip archive.

`compress_zip "<input>" "<output_folder>";`


#### Usage Scenario

- **Compatibility** matters.

- doesn't need any third party program to open it (supported by the OS, like
  Windows, MAC OSX, Linux)

- doesn't has high hardware requirements to create the archive.

The zip archive file format suits best to this case.


#### Parameters

`"<input>"`

**possible values:**

- exact filename

- Simple text file formats. In this case the function will handle the input as
a list file.

- any other wildcard pattern.


**default value:** `*.txt`. If this parameter is omitted by the user, the function
will look for list files


In this case the function will handle the input as
a list file.


`"<output_folder>"`

**possible values:**

- absolute or relative path to the folder, where the function will place the
output archive. The output file will be named after the input filename.


### compress_7z

`compress_7z "<input>" "<output_folder>" "<RAM_gb>";`

Compress files into a 7-zip archive.


#### Usage Scenario

- **Compression Ratio** matters.

- Create the smallest archive as possible from the input.

- Large amount of available free RAM

According [Benchmarks] (https://www.howtogeek.com/200698/benchmarked-whats-the-best-file-compression-format/) the 7-zip archive file format suits best to this case.


#### Features

- Set the dictionary size based on the current amount of free RAM. To maximize
this close any unnecessary running program, when you using this function.  


dictionary size | needed memory for compressing |
--------------- | ----------------------------- |
64mb  | 709mb |
128mb | 1381mb |
256mb | 2725mb |
512mb | 5413mb |
1024mb | 10789mb |
1536mb | 16677mb |


#### Parameters

`"<input>"`

**possible values:**

- exact filename

- Simple text file formats, like `txt`. In this case the function will handle the input as
a list file.

- any other wildcard pattern.


**default value:** `*.txt`


`"<output_folder>"`

**possible values:**

- absolute or relative path to the folder, where the function will place the
output archive. The output file will be named after the input filename.


## Developer notes

### Code style

The code in this repository formatted according the guidelines of the **Google Style Guides**.
If you want to contribute to this project, then read the guide first.

https://google.github.io/styleguide/shellguide.html


## Sources

https://en.wikipedia.org/wiki/ZIP_(file_format)

https://axelstudios.github.io/7z/#!/

https://sevenzip.osdn.jp/chm/cmdline/index.htm

https://www.howtogeek.com/200698/benchmarked-whats-the-best-file-compression-format/
