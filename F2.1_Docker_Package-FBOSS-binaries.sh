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

cpu_count=$(grep -c ^processor /proc/cpuinfo)
#cpu_count=16
echo "CPU Count=$cpu_count"

TO_CMD_PACKAGE="y"
if [[ "${TO_CMD_PACKAGE}" == "y" ]]; then
    # Package FBOSS binaries and library dependencies
    pushd  $GITHUB_WORKSPACE
    echo "Packaging build artifacts..."
    echo "Delete ${BUILD_OUTPUT}/fboss_bins.tar.zst ..."
    sudo rm -rf ${BUILD_OUTPUT}/fboss_bins.tar.zst

    sudo ./fboss/oss/scripts/package-fboss.py \
      --scratch-path ${BUILD_OUTPUT} \
      --compress

    if [ ! -f "${BUILD_OUTPUT}/fboss_bins.tar.zst" ]; then
        echo "Error:  ${BUILD_OUTPUT}/fboss_bins.tar.zst not found!"
        exit 1
    else
        echo "Pass:  ${BUILD_OUTPUT}/fboss_bins.tar.zst found!"
    fi


    popd
fi

