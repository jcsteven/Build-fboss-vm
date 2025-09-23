#!/bin/bash
# -------------------------------------------------------
# Automatic preparation script
# JC Yu,     June 09,2024
# -------------------------------------------------------
# IMPORTANT:
#   When use: './<this script file>  '
# -------------------------------------------------------
source 0.0_comm.sh
current_dir=$(pwd)
TARGET="fboss_platform_services"
LOG_DIR=${current_dir}/build_log/
BUILD_LOG=$LOG_DIR/fboss_build-${TARGET}-$(date +"%Y%m%d_%H%M%S").log
mkdir -p ${LOG_DIR}

cpu_count=$(grep -c ^processor /proc/cpuinfo)
#cpu_count=16
echo "CPU Count=$cpu_count"
echo "GITHUB_WORKSPACE=${GITHUB_WORKSPACE}"
echo "GITHUB_TESTSPACE=${GITHUB_TESTSPACE}"
echo "BUILD_OUTPUT_NAME=${BUILD_OUTPUT_NAME}"
echo "BUILD_OUTPUT=${BUILD_OUTPUT}"
echo "BUILS_INSTALLED=${BUILS_INSTALLED}"
