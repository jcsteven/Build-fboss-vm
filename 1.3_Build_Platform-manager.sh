#!/bin/bash
# -------------------------------------------------------
# Automatic preparation script
# JC Yu,     June 09,2024
# -------------------------------------------------------
# IMPORTANT:
#   When use: './<this script file>  '
# -------------------------------------------------------
source 0.0_comm.sh

cpu_count=$(grep -c ^processor /proc/cpuinfo)
cpu_count=16
echo "CPU Count=$cpu_count"

pushd  $GITHUB_WORKSPACE
    TO_CMD_1="y"
    if [[ "${TO_CMD_1}" == "y" ]]; then
        cmdl="./build/fbcode_builder/getdeps.py build  --num-jobs $cpu_count"
        cmdl+=' --extra-cmake-defines={"CMAKE_BUILD_TYPE":"MinSizeRel","CMAKE_CXX_STANDARD":"20"}'
        cmdl+=" --scratch-path $BUILD_OUTPUT" 
        cmdl+=" --allow-system-packages fboss" 
        cmdl+=" --cmake-target  platform_manager" 
        cmdl+=" --src-dir ." 
    fi

    echo "==> $cmdl"
    $cmdl 

popd
