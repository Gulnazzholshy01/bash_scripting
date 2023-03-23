#!/bin/bash

read -p "Enter the directory you want to remove cruft from?   " directory
cd $directory
read -p "Enter the file type, use d or f:    " file_type
read -p "How many days files should me unmodified?   " unmodified_days

readarray -t found_files < <(find . -type $file_type -mtime $unmodified_days)
if [ -z "${found_files[@]}" ]; then
    echo "There is no matching files to this time"
    exit
else 
    for file in "${found_files[@]}"; do
    rm -i "$file"
    done
fi 
