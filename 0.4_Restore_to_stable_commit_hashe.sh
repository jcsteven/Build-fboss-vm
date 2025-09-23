#!/bin/bash
# -------------------------------------------------------
# Automatic preparation script
# JC Yu,     June 09,2024
# -------------------------------------------------------
# IMPORTANT:
#   When use: './<this script file>  '
# -------------------------------------------------------
source 0.0_comm.sh

TO_STABLE_RELEASE="y"
if [[ "${TO_STABLE_RELEASE}" == "y" ]]; then
pushd $GITHUB_WORKSPACE
    # Remove the stable commit hash pinning if it was done earlier
    rm -rf build/deps/github_hashes/facebook
    rm -rf build/deps/github_hashes/facebookincubator

    #git stash # This is to save the build-helper changes
    #git pull
    #git stash pop # This is to restore the build-helper changes

    # Optionally ping to latest stable commit hashes
    tar -xvf fboss/oss/stable_commits/latest_stable_hashes.tar.gz
popd
fi