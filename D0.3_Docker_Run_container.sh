#!/bin/bash
# -------------------------------------------------------
# Automatic preparation script
# JC Yu,     June 09,2024
# -------------------------------------------------------
# IMPORTANT:
#   When use: './<this script file>  '
# -------------------------------------------------------
source 0.0_comm.sh
cmdl="sudo docker run -d -it --name=$DOCKER_NAME \
-v ${BUILD_OUTPUT}:${DOCKER_BUILD_OUTPUT}:z  -v ${HOME_BASE}/Build-fboss-vm:/var/FBOSS/Build-fboss-docker:z \
-v ${GITHUB_WORKSPACE}:${DOCKER_WORKSPACE}:z  \
--cap-add=CAP_AUDIT_WRITE  $DOCKER_IMAGE:latest bash" 
echo "==> $cmdl"
$cmdl