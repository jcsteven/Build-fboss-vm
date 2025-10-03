#!/bin/bash
# -------------------------------------------------------
# Automatic preparation script
# JC Yu,     June 09,2024
# -------------------------------------------------------
# IMPORTANT:
#   When use: './<this script file>  '
# -------------------------------------------------------
set -e
source 0.0_comm.sh
current_dir=$(pwd)

#!/bin/bash
# remove_fboss_containers.sh

# Find all containers from fboss_image (any tag) with ID, Image, and Name
containers=$(sudo docker ps -a --filter "ancestor=${DOCKER_IMAGE}" --format "{{.ID}} {{.Image}} {{.Names}}")

if [ -z "$containers" ]; then
    echo "No containers found from ${DOCKER_IMAGE}."
else
    echo "Removing containers from ${DOCKER_IMAGE} one by one..."
    echo
    # Loop through each container line
    while read -r id image name; do
        echo "Deleting container ID=$id, IMAGE=$image, NAME=$name ..."
        sudo docker stop "$id" || true
        sleep 1
        sudo docker rm -f "$id"
    done <<< "$containers"

    echo
    echo "All fboss_image containers removed."
fi