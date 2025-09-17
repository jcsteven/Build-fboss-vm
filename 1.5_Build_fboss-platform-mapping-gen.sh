#!/bin/bash
# -------------------------------------------------------
# Automatic preparation script
# JC Yu,     June 09,2024
# -------------------------------------------------------
# IMPORTANT:
#   When use: './<this script file>  '
# -------------------------------------------------------
source 0.0_comm.sh

export GITHUB_ACTIONS_BUILD=1 
printenv GITHUB_ACTIONS_BUILD

cpu_count=$(grep -c ^processor /proc/cpuinfo)

echo "CPU Count=$cpu_count"

pushd  $GITHUB_WORKSPACE

TO_CMD_0="y"
if [[ "${TO_CMD_0}" == "y" ]]; then
    cmdl="./build/fbcode_builder/getdeps.py build  --num-jobs $cpu_count"
    cmdl+=' --extra-cmake-defines={"CMAKE_BUILD_TYPE":"MinSizeRel","CMAKE_CXX_STANDARD":"20"}' 
    cmdl+=" --scratch-path $BUILD_OUTPUT" 
    cmdl+=" --allow-system-packages" 
    cmdl+=" --cmake-target  fboss-platform-mapping-gen" 
    cmdl+=" --src-dir ." 
    cmdl+=" fboss" 
fi
echo "==> $cmdl"
$cmdl 

popd
