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
TARGET="fboss-platform-mapping-gen"
LOG_DIR=${current_dir}/build_log/
BUILD_LOG=$LOG_DIR/fboss_Run-${TARGET}-$(date +"%Y%m%d_%H%M%S").log
mkdir -p ${LOG_DIR}


pushd  $DOCKER_WORKSPACE
PLATFORM_NAME="montblanc"
#PLATFORM_NAME="minipack3n"
#PLATFORM_NAME="wedge800bact"
#PLATFORM_NAME="wedge800cact" 

PMG_CMD="python3 ${DOCKER_BUILD_OUTPUT}/build/fboss/fboss-platform-mapping-gen"
INPUT_DIR="${DOCKER_WORKSPACE}"
OUTPUT_DIR=${current_dir}/output
echo "OUTPUT_DIR=${OUTPUT_DIR}" | tee -a $BUILD_LOG
echo "INPUT_DIR=${INPUT_DIR}" | tee -a $BUILD_LOG
echo "PLATFORM_NAME=${PLATFORM_NAME}" | tee -a $BUILD_LOG


TO_CMD_1="y"
if [[ "${TO_CMD_1}" == "y" ]]; then
    mkdir -p ${OUTPUT_DIR}
    cmdl="${PMG_CMD} --input-dir ${INPUT_DIR} --output-dir  ${OUTPUT_DIR} --platform-name ${PLATFORM_NAME}"
    echo "==> $cmdl" 2>&1 | tee -a $BUILD_LOG
    eval $cmdl  2>&1 | tee -a $BUILD_LOG
fi
popd
