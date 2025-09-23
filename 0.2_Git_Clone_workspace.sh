#!/bin/bash
# -------------------------------------------------------
# Automatic preparation script
# JC Yu,     June 09,2024
# -------------------------------------------------------
# IMPORTANT:
#   When use: './<this script file>  '
# -------------------------------------------------------
source 0.0_comm.sh

TO_CLONE_WORKSPACE="y"
if [[ "${TO_CLONE_WORKSPACE}" == "y" ]]; then
pushd ~ 
    echo "==> mkdir -p $BUILD_OUTPUT"
    mkdir -p $BUILD_OUTPUT

    #cmdl="git clone https://github.com/facebook/fboss  -b fixup-T205733938-main fboss.git"
    #cmdl="git clone https://github.com/facebook/fboss  -b a1cfcb02fa12939761f9e7155295c2cf6f0dc776 fboss.git" ## 2024-1101
    cmdl="git clone https://github.com/facebook/fboss  ${GITHUB_WORKSPACE}"
    echo "==> $cmdl"
    $cmdl

popd
fi

TO_STABLE_FBOSS_DEP="n"
if [[ "${TO_STABLE_FBOSS_DEP}" == "y" ]]; then
    pushd  pushd $GITHUB_WORKSPACE
    echo "==> Work in `pwd`"
    rm -rf build/deps/github_hashes/
    tar xvzf fboss/oss/stable_commits/latest_stable_hashes.tar.gz
    #./build/fbcode_builder/getdeps.py install-system-deps --recursive fboss
    #./installer/centos-8-x64_64/install-tools.sh
    #./build/fbcode_builder/getdeps.py install-system-deps --recursive fboss
    popd
fi



TO_PATCH="n"
if [[ "${TO_PATCH}" == "y" ]]; then
    pushd $GITHUB_WORKSPACE
    echo "==> cat $FIXED/01-Fix-Dockerfile.patch | patch -p1"
    cat $FIXED/01-Fix-Dockerfile.patch | patch -p1
    popd
fi
  
