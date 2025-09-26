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
#cpu_count=16
echo "CPU Count=$cpu_count"

pushd  $DOCKER_WORKSPACE
TO_CMD_0="n"
if [[ "${TO_CMD_0}" == "y" ]]; then
    cmdl="./build/fbcode_builder/getdeps.py build  --num-jobs $cpu_count"
    cmdl+=' --extra-cmake-defines={"CMAKE_BUILD_TYPE":"MinSizeRel","CMAKE_CXX_STANDARD":"20"}'
    cmdl+=" --scratch-path ${DOCKER_BUILD_OUTPUT}  --src-dir ./" 
    cmdl+=" --allow-system-packages" 
    cmdl+=" --cmake-target  github_actions_fboss_platform_services" 
    cmdl+=" fboss"

    echo "==> $cmdl"
    $cmdl 
fi

TO_CMD_1="y"
if [[ "${TO_CMD_1}" == "y" ]]; then
./build/fbcode_builder/getdeps.py build --allow-system-packages --scratch-path ${DOCKER_BUILD_OUTPUT} --src-dir ./ \
    --extra-cmake-defines='{"CMAKE_BUILD_TYPE": "MinSizeRel", "CMAKE_CXX_STANDARD": "20","CMAKE_C_COMPILER": "/opt/rh/gcc-toolset-12/root/usr/bin/gcc", "CMAKE_CXX_COMPILER": "/opt/rh/gcc-toolset-12/root/usr/bin/g++"}' \
    --allow-system-packages \
    --cmake-target  github_actions_fboss_platform_services \
  fboss
fi
popd
