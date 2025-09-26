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
    #git reset --hard 61011a76a62f61bea7ee60f4ca6e8dfa91fd87b3 # 2025-0924
    #git reset --hard 3ae6f99ee05bd97a0f5ac369c4c1ec3eab375a9a # 2025-0923 -1: 3ae6f99ee05bd97a0f5ac369c4c1ec3eab375a9a
    #git reset --hard 6d66175dca45afbc8c870b2caa9a8e55ebb492f6 # 2025-0923-2: 6d66175dca45afbc8c870b2caa9a8e55ebb492f6
    #git reset --hard e6187b4c5d779b41d913217811f9b270ed2af117 # 2025-0923-3: e6187b4c5d779b41d913217811f9b270ed2af117
    #git reset --hard 9777affa055201cd6d48150aa6cba4c24f5a9fdd # 2025-0919-1: 9777affa055201cd6d48150aa6cba4c24f5a9fdd


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
  
