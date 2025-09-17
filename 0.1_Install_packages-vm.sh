#!/bin/bash
# -------------------------------------------------------
# Automatic preparation script
# JC Yu,     June 09,2024
# -------------------------------------------------------
# IMPORTANT:
#   When use: './<this script file>  '
# -------------------------------------------------------
source 0.0_comm.sh

TO_INSTALL_DEP_1="y"
if [[ "${TO_INSTALL_DEP_1}" == "y" ]]; then
    sudo dnf update -y
    sudo dnf remove -y cmake

    sudo dnf install -y git sudo lsof

    sudo dnf install -y 'dnf-command(config-manager)'
    sudo dnf config-manager --set-enabled crb
    sudo dnf install -y epel-release epel-next-release
    sudo dnf install -y autoconf automake binutils binutils-devel 
    sudo dnf install -y bzip2 
    sudo dnf install -y bzip2-devel ## Error: Unable to find a match: bzip2-devl
    sudo dnf install -y cmake double-conversion double-conversion-devel libcurl-devel 
    sudo dnf install -y libcurl-minimal --allowerasing ## Error: Problem: problem with installed package libcurl-* >needs '--allowerasing'
    sudo dnf install -y libdwarf libdwarf-devel libevent-devel libffi libffi-devel 
    sudo dnf install -y libnghttp2 libnghttp2-devel libnl3 libnl3-devel libsodium-devel 
    sudo dnf install -y libsodium-static libtool libunwind libunwind-devel libusb libusb-devel 
    sudo dnf install -y libzstd libzstd-devel lz4-devel ncurses-devel ninja-build openssl
    sudo dnf install -y openssl-devel openssl-libs python3 python3-devel re2 re2-devel
    sudo dnf install -y snappy-devel xxhash-devel xz-devel zlib-devel zlib-static


    sudo  dnf install bison flex -y
    sudo dnf group install "Development Tools" -y
    sudo dnf install openssl* -y
    python3 -m pip install gitpython

    ## Installed packages are not included in Dockerfile 
    sudo dnf install systemd-devel -y
    sudo dnf install range-v3-devel -y
fi

