#!/bin/bash

ssh_id="$(curl -X GET \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
  "https://api.digitalocean.com/v2/account/keys" | jq .ssh_keys[1].id)"
   
#    echo $ssh_id

curl -X POST \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
  -d '{"name":"reviewsession","region":"nyc3","size":"s-1vcpu-1gb","image":"centos-stream-8-x64","ssh_keys":["'"$ssh_id"'"]}' \
  "https://api.digitalocean.com/v2/droplets"


