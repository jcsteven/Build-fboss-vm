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

export GITHUB_ACTIONS_BUILD=1
printenv GITHUB_ACTIONS_BUILD

cpu_count=$(grep -c ^processor /proc/cpuinfo)

echo "CPU Count=$cpu_count"

TO_CMD_CLEAN="y"
if [[ "${TO_CMD_CLEAN}" == "y" ]]; then
    pushd ~
    # Clean workspace
    echo "Cleaning workspace..."
    #sudo rm -rf ${BUILD_OUTPUT}/*
    sudo rm -rf ${GITHUB_WORKSPACE}"
    sudo rm -rf ${GITHUB_TESTSPACE}"
    popd   
fi

TO_CMD_CLONE="y"
if [[ "${TO_CMD_CLONE}" == "y" ]]; then
    # Clone Build workspace
    pushd ~ 
    cmdl="git clone https://github.com/facebook/fboss  $BUILD"
    echo "==> $cmdl"
    $cmdl
    popd
fi

TO_CMD_BUILD="y"
if [[ "${TO_CMD_BUILD}" == "y" ]]; then
    # Build FBOSS Platform Mapping Generation
    pushd  $GITHUB_WORKSPACE
    echo "Building fboss_platform_mapping_gen..."
    sudo ./fboss/oss/scripts/docker-build.py \
        --scratch-path ${BUILD_OUTPUT} \
        --target fboss_platform_mapping_gen \
        --no-docker-output \
        --no-system-deps \
        --env-var GITHUB_ACTIONS_BUILD \
        --local
    popd 
fi

TO_CMD_PACKAGE="y"
if [[ "${TO_CMD_PACKAGE}" == "y" ]]; then
    # Package FBOSS binaries and library dependencies
    pushd  $GITHUB_WORKSPACE
    echo "Packaging build artifacts..."
    sudo ./fboss/oss/scripts/package-fboss.py \
      --scratch-path ${BUILD_OUTPUT} \
      --compress
    popd
fi


TO_CMD_UPLOAD="n"
if [[ "${TO_CMD_UPLOAD}" == "y" ]]; then
    # (Optional) Upload artifact step is omitted in shell script
    echo "Uploading artifact..."
    # This step is typically handled by GitHub Actions and is not included in this script.
fi

TO_CMD_CLONE_TEST="y"
if [[ "${TO_CMD_CLONE_TEST="y"}" == "y" ]]; then
    # Clone Test workspace
    pushd ~ 
    cmdl="git clone https://github.com/facebook/fboss  $TEST"
    echo "==> $cmdl"
    $cmdl
    popd
fi

TO_CMD_UNITTEST="y"
if [[ "${TO_CMD_UNITTEST}" == "y" ]]; then
    # Verification: Run unit tests using the packaged binaries
    pushd  $GITHUB_TESTSPACE
    echo "Running unit tests..."
    sudo ./fboss/oss/scripts/github_actions/docker-unittest.py \
      ${BUILD_OUTPUT}/fboss_bins.tar.zst
    popd
fi