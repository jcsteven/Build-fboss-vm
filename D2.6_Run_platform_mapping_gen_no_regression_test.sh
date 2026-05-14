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
TARGET="platform_mapping_gen_no_regression_test"
LOG_DIR=${current_dir}/build_log/
BUILD_LOG=$LOG_DIR/fboss_Run-${TARGET}-$(date +"%Y%m%d_%H%M%S").log
mkdir -p ${LOG_DIR}

DOCKER_BUILD_FBOSS=${DOCKER_BUILD_OUTPUT}/build/fboss
OUTPUT_DIR=${current_dir}/output
TEMP_DIR="/tmp/generated_platform_mappings"

pushd  $DOCKER_BUILD_FBOSS

PMG_CMD="${DOCKER_BUILD_FBOSS}/platform_mapping_gen_no_regression_test"
echo "DOCKER_BUILD_FBOSS=${DOCKER_BUILD_FBOSS}" | tee -a $BUILD_LOG
echo "OUTPUT_DIR=${OUTPUT_DIR}" | tee -a $BUILD_LOG
echo "TEMP_GPM=${TEMP_GPM}" | tee -a $BUILD_LOG

TO_CMD_1="y"
if [[ "${TO_CMD_1}" == "y" ]]; then
    mkdir -p ${OUTPUT_DIR}
    cmdl="python ${PMG_CMD}"
    echo "==> $cmdl" 2>&1 | tee -a $BUILD_LOG
    eval $cmdl  2>&1 | tee -a $BUILD_LOG
fi

TO_CMD_2="y"
if [[ "${TO_CMD_2}" == "y" ]]; then
    W800BA_JSON="wedge800cact_platform_mapping.json"
    # If $TEMP_DIR/$W800BA_JSON exists, copy it to $OUTPUT_DIR
    if [[ -f "${TEMP_DIR}/${W800BA_JSON}" ]]; then
        echo "Copying ${TEMP_DIR}/${W800BA_JSON} to ${OUTPUT_DIR}/" 2>&1 | tee -a $BUILD_LOG
        cp "${TEMP_DIR}/${W800BA_JSON}" "${OUTPUT_DIR}/"
    fi

fi
popd

