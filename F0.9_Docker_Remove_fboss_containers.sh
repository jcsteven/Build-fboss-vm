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

# Find all container IDs with IMAGE=fboss_image (any tag) and remove them
containers=$(sudo docker ps -a --filter "ancestor=fboss_image" --format "{{.ID}}")

if [ -z "$containers" ]; then
    echo "No containers found from fboss_image."
else
    echo "Stopping containers from fboss_image..."
    sudo docker stop $containers || true
    echo "Removing containers from fboss_image..."
    sudo docker rm -f $containers
    echo "Done."
fi
