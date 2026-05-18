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
#TARGET="github_actions_fboss_platform_services"
#TARGET="fboss-platform-mapping-gen"
TARGET="fboss_platform_mapping_gen"
LOG_DIR=${current_dir}/build_log/
BUILD_LOG=$LOG_DIR/fboss_build-${TARGET}-$(date +"%Y%m%d_%H%M%S").log
mkdir -p ${LOG_DIR}

cpu_count=$(grep -c ^processor /proc/cpuinfo)
#cpu_count=16
echo "CPU Count=$cpu_count"

pushd  $DOCKER_WORKSPACE
TO_CMD_0="y"
if [[ "${TO_CMD_0}" == "y" ]]; then
    cmdl="./fboss/oss/scripts/run-getdeps.py build"
    cmdl+=" --num-jobs $cpu_count"
    cmdl+=" --allow-system-packages"
    cmdl+=" --build-type MinSizeRel"   
    cmdl+=" --extra-cmake-defines='{\"CMAKE_CXX_STANDARD\": \"20\", \"RANGE_V3_TESTS\": \"OFF\", \"RANGE_V3_PERF\": \"OFF\"}'"
    cmdl+=" --scratch-path ${DOCKER_BUILD_OUTPUT}"
    cmdl+=" --cmake-target  ${TARGET}"
    cmdl+=" --src-dir ."
    cmdl+=" fboss"
fi

echo "==> $cmdl" 2>&1 | tee -a $BUILD_LOG
eval $cmdl  2>&1 | tee -a $BUILD_LOG
popd
