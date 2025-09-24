#!/bin/bash
# -------------------------------------------------------
# Automatic preparation script
# JC Yu,     June 09,2024
# -------------------------------------------------------
# IMPORTANT:
#   When use: './<this script file>  '
# -------------------------------------------------------
set -e
source 0.0_comm.sh
current_dir=$(pwd)

TO_CMD_UNITTEST="y"
if [[ "${TO_CMD_UNITTEST}" == "y" ]]; then
    # Verification: Run unit tests using the packaged binaries
    pushd  $GITHUB_WORKSPACE
    echo "Running unit tests..."
    # ./fboss/oss/scripts/github_actions/fbossdocker-unittest.py
    sudo ${current_dir}/fboss_docker-unittest.py \
      ${BUILD_OUTPUT}/fboss_bins.tar.zst
    popd
fi