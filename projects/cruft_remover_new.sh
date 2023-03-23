#!/bin/bash

read -p "Enter the directory you want to remove cruft from?   " directory
cd $directory
read -p "Enter the file type, use d or f:    " file_type
read -p "How many days files should me unmodified?   " unmodified_days

readarray -t found_files < <(find . -type $file_type -mtime $unmodified_days)
rm "${found_files[@]}"

if [ $? -eq 0 ]; then
    echo "Unnecessary files deleted succesfully! "
else 
    echo "Error occured, check for the error!"
fi 

