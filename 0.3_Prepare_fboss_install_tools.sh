#!/bin/bash
# -------------------------------------------------------
# Automatic preparation script
# JC Yu,     June 09,2024
# -------------------------------------------------------
# IMPORTANT:
#   When use: './<this script file>  '
# -------------------------------------------------------
source 0.0_comm.sh

pushd $GITHUB_WORKSPACE
THIS_BLK_IS_NG="n"
if [[ "${THIS_BLK_IS_NG}" == "y" ]]; then

    echo "==> Work in `pwd`"
    cmdl="./installer/centos-8-x64_64/install-tools.sh"
    echo "==> $cmdl"
    $cmdl
fi    
popd


