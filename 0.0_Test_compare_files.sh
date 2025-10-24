#!/bin/bash
# -------------------------------------------------------
# Automatic preparation script
# JC Yu,     June 09,2024
# -------------------------------------------------------
# IMPORTANT:
#   When use: './<this script file>  '
# -------------------------------------------------------
source 0.0_comm.sh
current_dir=$(pwd)
file_1=docker-unittest.py
file_2=${GITHUB_WORKSPACE}/fboss/oss/scripts/github_actions/docker-unittest.py
cmdl="diff  ${file_1} ${file_2}"
echo "==>${cmdl}"
${cmdl}
