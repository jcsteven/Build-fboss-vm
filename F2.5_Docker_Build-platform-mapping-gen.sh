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
TARGET="fboss_platform_services"

cpu_count=$(grep -c ^processor /proc/cpuinfo)
#cpu_count=16
echo "CPU Count=$cpu_count"

TO_CMD_BUILD="y"
if [[ "${TO_CMD_BUILD}" == "y" ]]; then
    # Build FBOSS Platform Mapping Generation
    pushd  $GITHUB_WORKSPACE
    # Check if fboss_docker-build.py exists
    if [ ! -f "./fboss/oss/scripts/docker-build.py" ]; then
        echo "Error: ${current_dir}/fboss_docker-build.py not found!"
        exit 1
    fi

       
    echo "Building fboss_platform_mapping_gen..."
    sudo ${current_dir}/fboss_docker-build.py \
        --scratch-path ${BUILD_OUTPUT} \
        --target ${TARGET} \
        --no-docker-output \
        --no-system-deps \
        --env-var GITHUB_ACTIONS_BUILD \
        --local 
    popd 
fi

