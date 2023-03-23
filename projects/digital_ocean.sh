#!/bin/bash

do_droplet="$(curl -X GET \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
  "https://api.digitalocean.com/v2/droplets")" 
  
droplet_numbers=$(echo $do_droplet | jq .droplets | jq length)
droplet_numbers=$(($droplet_numbers-1))

for droplet in $(seq 0 $droplet_numbers); do
     echo "Droplet $droplet: ID: $(echo $do_droplet | jq -r .droplets[$droplet].id) Name: $(echo $do_droplet | jq -r .droplets[$droplet].name)"
done
