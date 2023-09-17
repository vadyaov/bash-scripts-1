#!/bin/bash

fold_number=`find $1 -mindepth 1 -type d | wc -l`
top_biggest_folders=`find $1 -maxdepth 1 -mindepth 1 -type d\
                       -exec du -h {} --max-depth=0 \; | sort -rh | head -n 5\
                       | awk '{print NR " - " $2 ", " $1}'`
files_count=`find $1 -maxdepth 1 -type f | wc -l`

conf_files_count=`find $1 -maxdepth 1 -type f -name "*.conf" | wc -l`
text_files_count=`find $1 -maxdepth 1 -type f -name "*.txt" | wc -l`
exec_files_count=`find $1 -maxdepth 1 -type f -executable | wc -l`
arch_files_count=`find $1 -maxdepth 1 -type f \( -name "*.zip" -o -name "*.tar.gz" \) | wc -l`
log_files_count=`find $1 -maxdepth 1 -type f -name "*.log" | wc -l`
links_count=`find $1 -maxdepth 1 -type l | wc -l`

top_biggest_files=$(find $1 -maxdepth 1 -type f -exec du -h {} \; | sort -rh | head -n 10 | \
  awk '{path = $2; sub(/^[ \t]+/, ""); extension = ""; if (match(path, /\.[^.]+$/)) extension = substr(path, RSTART + 1); print NR " - " path ", " $1 ", " extension}')

top_biggest_exec=`find "$1" -maxdepth 1 -type f -executable -exec du -h {} \; |
  sort -rh | head -n 10 | while read -r line; do
    path=$(echo "$line" | awk '{print $2}')
    size=$(echo "$line" | awk '{print $1}')
    md5=$(md5sum "$path" | awk '{print $1}')
    echo "$path $size $md5"
  done | awk '{print NR " - " $1 ", " $2 ", " $3}'`
