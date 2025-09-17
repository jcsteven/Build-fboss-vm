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

pushd  $GITHUB_WORKSPACE

#PLATFORM_NAME="montblanc"
#PLATFORM_NAME="minipack3n"
PLATFORM_NAME="wedge800ba" 

PMG_CMD="${BUILD_OUTPUT}/build/fboss/fboss-platform-mapping-gen"
INPUT_DIR="${GITHUB_WORKSPACE}"
OUTPUT_DIR=${current_dir}/output
echo "OUTPUT_DIR=${OUTPUT_DIR}"
echo "INPUT_DIR=${INPUT_DIR}"
echo "PLATFORM_NAME=${PLATFORM_NAME}"

TO_CMD_1="y"
if [[ "${TO_CMD_1}" == "y" ]]; then
    mkdir -p ${OUTPUT_DIR}
    cmdl="${PMG_CMD} --input-dir ${INPUT_DIR} --output-dir  ${OUTPUT_DIR} --platform-name ${PLATFORM_NAME}"
    echo "==> $cmdl"
    $cmdl
fi

popd
