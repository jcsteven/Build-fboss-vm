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
    #sudo docker build . -t $DOCKER_IMAGE -f fboss/oss/docker/Dockerfile
    cmdl="sudo docker build . -t $DOCKER_IMAGE -f fboss/oss/docker/Dockerfile" 
    echo "==> $cmdl"
    $cmdl
popd
