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
TARGET="qsfp_targets"
LOG_DIR=${current_dir}/build_log/
BUILD_LOG=$LOG_DIR/Docker_build-${TARGET}-$(date +"%Y%m%d_%H%M%S").log
mkdir -p ${LOG_DIR}

cpu_count=$(grep -c ^processor /proc/cpuinfo)
#cpu_count=16
echo "CPU Count=$cpu_count"

TO_CMD_BUILD="y"
if [[ "${TO_CMD_BUILD}" == "y" ]]; then
    pushd  $GITHUB_WORKSPACE
    echo "Building ${TARGET}..." | tee -a $BUILD_LOG

    # Check if fboss_docker-build.py exists
    if [ ! -f "./fboss/oss/scripts/docker-build.py" ]; then
        echo "Error: ${current_dir}/fboss_docker-build.py not found!"  | tee -a $BUILD_LOG
        exit 1
    fi

    echo "sudo ${current_dir}/fboss_docker-build.py \
        --scratch-path ${BUILD_OUTPUT} \
        --target ${TARGET} \
        --no-docker-output \
        --no-system-deps \
        --env-var GITHUB_ACTIONS_BUILD \
        --num-jobs $(($cpu_count - 4)) \
        --local" | tee -a $BUILD_LOG


    sudo ${current_dir}/fboss_docker-build.py \
        --scratch-path ${BUILD_OUTPUT} \
        --target ${TARGET} \
        --no-docker-output \
        --no-system-deps \
        --env-var GITHUB_ACTIONS_BUILD \
        --num-jobs $(($cpu_count - 4)) \
        --local 2>&1 | tee -a $BUILD_LOG
    popd 
fi