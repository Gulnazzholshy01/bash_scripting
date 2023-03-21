#!/bin/bash

echo "Hello, welcome to the BASH WEATHER FORECAST"
sleep 1
read -p "Enter your name:  " name
echo "Hello, $name!"

readarray -t city < cities.txt 
PS3="What city do you live in?" 
select yourcity in ${city[@]}; do
    curl wttr.in/$yourcity 
break
done  