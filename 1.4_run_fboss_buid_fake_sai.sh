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
BUILD_LOG=$current_dir/build_log/fboss_build_$(date +"%Y%m%d_%H%M%S").log
export GITHUB_ACTIONS_BUILD=1 
printenv GITHUB_ACTIONS_BUILD

cpu_count=$(grep -c ^processor /proc/cpuinfo)

echo "CPU Count=$cpu_count"

pushd  $GITHUB_WORKSPACE

TO_CMD_0="y"
if [[ "${TO_CMD_0}" == "y" ]]; then
    export BUILD_SAI_FAKE=1 
    cmdl="./build/fbcode_builder/getdeps.py build  --num-jobs $cpu_count"
    cmdl+=' --extra-cmake-defines={"CMAKE_BUILD_TYPE":"MinSizeRel","CMAKE_CXX_STANDARD":"20"}'
    cmdl+=" --scratch-path $BUILD_OUTPUT" 
    cmdl+=" --allow-system-packages" 
    cmdl+=" --cmake-target  fboss_fake_agent_targets" 
    cmdl+=" --src-dir ." 
    cmdl+=" fboss" 
fi

echo "==> $cmdl" 2>&1 | tee $BUILD_LOG 
$cmdl  2>&1 | tee $BUILD_LOG

popd

