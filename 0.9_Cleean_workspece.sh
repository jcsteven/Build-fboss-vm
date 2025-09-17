#!/bin/bash
# -------------------------------------------------------
# Automatic preparation script
# JC Yu,     June 09,2024
# -------------------------------------------------------
# IMPORTANT:
#   When use: './<this script file>  '
# -------------------------------------------------------
source 0.0_comm.sh

echo "==> sudo rm -rf ${BUILD_OUTPUT}"
sudo rm -rf ${BUILD_OUTPUT}

echo "==> sudo rm -rf ${GITHUB_WORKSPACE}"
sudo rm -rf ${GITHUB_WORKSPACE}



