#!/bin/bash
# -------------------------------------------------------
# Automatic preparation script
# JC Yu,     June 09,2024
# -------------------------------------------------------
# IMPORTANT:
#   When use: './<this script file>  '
# -------------------------------------------------------
## 1. Initial setup on VM export CONTAINER_TAR=fboss_centos8.tar
CONTAINER_TAR=fboss_centos8.tar
DOCKER_IMAGE=fboss_centos8
DOCKER_NAME=FBOSS_CENTOS8
GITHUB_WORKSPACE="${HOME}/fboss.git"
BUILD_OUTPUT_NAME=host-build
BUILD_OUTPUT="${HOME}/${BUILD_OUTPUT_NAME}"
BUILS_INSTALLED="${BUILD_OUTPUT}/installed"

