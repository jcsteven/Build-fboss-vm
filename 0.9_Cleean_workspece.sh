#!/bin/bash
# -------------------------------------------------------
# Automatic preparation script
# JC Yu,     June 09,2024
# -------------------------------------------------------
# IMPORTANT:
#   When use: './<this script file>  '
# -------------------------------------------------------
source 0.0_comm.sh

echo "==> sudo rm -rf ${BUILD_OUTPUT}/*"
#sudo rm -rf ${BUILD_OUTPUT}/downloads
sudo rm -rf ${BUILD_OUTPUT}/build
sudo rm -rf ${BUILD_OUTPUT}/repos
sudo rm -rf ${BUILD_OUTPUT}/installed
sudo rm -rf ${BUILD_OUTPUT}/extracted
sudo rm -rf ${BUILD_OUTPUT}/fboss_bins.tar.zst
sudo rm -rf ${BUILD_OUTPUT}/fboss_bins-*

echo "==> sudo rm -rf ${GITHUB_WORKSPACE}"
sudo rm -rf ${GITHUB_WORKSPACE}
echo "==> sudo rm -rf ${GITHUB_TESTSPACE}"
sudo rm -rf ${GITHUB_TESTSPACE}



