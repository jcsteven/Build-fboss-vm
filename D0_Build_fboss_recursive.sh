#!/bin/bash
# -------------------------------------------------------
# Automatic preparation script
# JC Yu,     June 09,2024
# -------------------------------------------------------
# IMPORTANT:
#   When use: './<this script file>  '
# -------------------------------------------------------
source 0.0_comm.sh

echo "==> DOCKER_WORKSPACE=$DOCKER_WORKSPACE"
pushd $DOCKER_WORKSPACE
    echo "==> Work in `pwd`"
    cmdl="./build/fbcode_builder/getdeps.py install-system-deps --recursive fboss"
    echo "==> $cmdl"
    $cmdl 
popd
