#!/bin/bash

read -p "name your repo:   " repo_name 
read -p "give description to repo:   " description 

response="$(curl -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  https://api.github.com/user/repos \
  -d '{"name":"'"$repo_name"'","description":"'"$description"'"}')" 

# echo $response | jq

echo "Here is some information about the repo"
echo "Avatar url: $(echo $response | jq -r .owner.avatar_url)"
echo "Owner: $(echo $response | jq -r .owner.login)"
echo "GitHub Url: $(echo $response | jq -r .owner.html_url)"
