#!/bin/bash
# -------------------------------------------------------
# Automatic preparation script
# JC Yu,     June 09,2024
# -------------------------------------------------------
# IMPORTANT:
#   When use: './<this script file>  '
# -------------------------------------------------------
## 1. Initial setup on VM export CONTAINER_TAR=fboss_centos8.tar
CONTAINER_TAR=fboss_centos8.tar
DOCKER_IMAGE=fboss_images_${USER}
DOCKER_NAME=fboss_docker_${USER}
BUILD="fboss.git"
TEST="fboss.ttt"

# Get the current working directory
current_dir=$(pwd)
echo "Current Directory: $current_dir"

# Check if current directory contains "/data" at beginning
if [[ "$current_dir" == /data* ]]; then
    echo "Directory contains /data"
    HOME_BASE="/data/$(whoami)"
else
    echo "Directory does not contain /data"
    HOME_BASE="/home/$(whoami)"
fi
echo "HOME_BASE=${HOME_BASE}"

GITHUB_WORKSPACE="${HOME_BASE}/${BUILD}"
GITHUB_TESTSPACE="${HOME_BASE}/${TEST}"
DOCKER_WORKSPACE="/var/FBOSS/${BUILD}"
BUILD_OUTPUT_NAME=host-build
BUILD_OUTPUT="${HOME_BASE}/${BUILD_OUTPUT_NAME}"
BUILS_INSTALLED="${BUILD_OUTPUT}/installed"
DOCKER_BUILD_OUTPUT="/var/FBOSS/${BUILD_OUTPUT_NAME}"
