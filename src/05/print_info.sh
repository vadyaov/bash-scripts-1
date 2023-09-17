#!/bin/bash

echo "Total number of folders (including all nested ones) = $fold_number"
echo -e "TOP 5 folders of maximum size arranged in descending order (path and size):
$top_biggest_folders"
echo "Total number of files = $files_count"
echo -e "Number of:
Configuration files (with the .conf extension) = $conf_files_count
Text files = $text_files_count
Executable files = $exec_files_count
Log files (with the extension .log) = $log_files_count
Archive files = $arch_files_count
Symbolic links = $links_count"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):
$top_biggest_files"
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):
$top_biggest_exec"
