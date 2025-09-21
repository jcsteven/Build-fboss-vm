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
TARGET="platform_manager"
LOG_DIR=${current_dir}/build_log/
BUILD_LOG=$LOG_DIR/fboss_build-${TARGET}-$(date +"%Y%m%d_%H%M%S").log
mkdir -p ${LOG_DIR}

cpu_count=$(grep -c ^processor /proc/cpuinfo)
#cpu_count=16
echo "CPU Count=$cpu_count"

pushd  $GITHUB_WORKSPACE
TO_CMD_0="y"
if [[ "${TO_CMD_0}" == "y" ]]; then
    cmdl="./build/fbcode_builder/getdeps.py build  --num-jobs $cpu_count"
    cmdl+=' --extra-cmake-defines={"CMAKE_BUILD_TYPE":"MinSizeRel","CMAKE_CXX_STANDARD":"20"}'
    cmdl+=" --scratch-path $BUILD_OUTPUT" 
    cmdl+=" --allow-system-packages" 
    cmdl+=" --cmake-target  $TARGET" 
    cmdl+=" --src-dir ."
    cmdl+=" fboss" 
fi

echo "==> $cmdl" 2>&1 | tee -a $BUILD_LOG
$cmdl  2>&1 | tee -a $BUILD_LOG
popd
