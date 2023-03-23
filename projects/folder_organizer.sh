#!/bin/bash

read -p "Which folder do you want to organize?  " folder
while read filename; do
     case "$filename" in 
     *.doc|*.txt|*.pdf) 
           subfolder="documents" ;;
     *.csv)
           subfolder="spreadsheets" ;;
     *) subfolder="."
     esac 

     if [ ! -d "$folder/$subfolder" ]; then
          mkdir "$folder/$subfolder" 
     fi
    
     mv "$filename" "$folder/$subfolder"

done < <(ls $folder)


