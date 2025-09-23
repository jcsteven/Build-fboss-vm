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
DOCKER_IMAGE=fboss_centos8
DOCKER_NAME=FBOSS_CENTOS8
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
BUILD_OUTPUT_NAME=host-build
BUILD_OUTPUT="${HOME_BASE}/${BUILD_OUTPUT_NAME}"
BUILS_INSTALLED="${BUILD_OUTPUT}/installed"
