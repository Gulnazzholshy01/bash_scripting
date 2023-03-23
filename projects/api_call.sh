#!/bin/bash

read -p "What is your GitHub username:?   " username
read -p "Which repo do you want to see:?  " repo

response="$(curl -H "Accept: application/vnd.github+json" \
https://api.github.com/repos/$username/$repo)" 

echo $response | jq
echo "Message: $(echo $response | jq -r .message)"

# echo "This is my avatar url: $(echo $response | jq -r .owner.avatar_url)" 


# echo "Here is some information about the repo"
# echo "Avatar url: $(echo $response | jq -r .owner.avatar_url)"
# echo "Avatar url: $(echo $response | jq -r .owner.login)"
# echo "Avatar url: $(echo $response | jq -r .owner.html_url)"

