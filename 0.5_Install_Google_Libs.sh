#!/bin/bash
# -------------------------------------------------------
# Automatic preparation script
# JC Yu,     June 09,2024
# -------------------------------------------------------
# IMPORTANT:
#   When use: './<this script file>  '
# -------------------------------------------------------
source 0.0_comm.sh

PACKAGES="pkgs"
PACKAGES_DIR=$HOME/$PACKAGES
pushd ~ 
mkdir -p $PACKAGES_DIR
pushd $PACKAGES_DIR

TO_INSTALL_FMT="b"
if [[ "${TO_INSTALL_FMT}" == "y" ]]; then
    git clone https://github.com/fmtlib/fmt.git
    pushd ./fmt
        mkdir build 
        pushd ./build
            cmake .. -DCMAKE_BUILD_TYPE=Release
            make -j$(nproc)
            sudo make install
        popd
    popd
fi


TO_INSTALL_GFLAG="n"
if [[ "${TO_INSTALL_GFLAG}" == "y" ]]; then
    git clone https://github.com/gflags/gflags.git
    pushd ./gflag
        mkdir build 
        pushd ./build
            cmake .. -DBUILD_SHARED_LIBS=ON
            make -j$(nproc)
            sudo make install
        popd
    popd
fi

TO_INSTALL_GTEST="y"
if [[ "${TO_INSTALL_GTEST}" == "y" ]]; then
    git clone https://github.com/google/googletest.git
    pushd ./googletest
        mkdir build 
        pushd ./build
            cmake .. -DBUILD_GMOCK=ON
            make -j$(nproc)
            sudo make install
        popd
    popd
fi


TO_INSTALL_GLOG="n"
if [[ "${TO_INSTALL_GLOG}" == "y" ]]; then
    git clone https://github.com/google/glog.git
    pushd ./glog
        mkdir build 
        pushd ./build
            cmake .. -DCMAKE_BUILD_TYPE=Release
            make -j$(nproc)
            sudo make install
        popd
    popd
fi


popd


