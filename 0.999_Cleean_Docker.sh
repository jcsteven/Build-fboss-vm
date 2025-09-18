#!/bin/bash
# -------------------------------------------------------
# Automatic preparation script
# JC Yu,     June 09,2024
# -------------------------------------------------------
# IMPORTANT:
#   When use: './<this script file>  '
# -------------------------------------------------------
source 0.0_comm.sh

echo "==> Clean Docker system"
echo "==> sudo docker container kill -a && sudo docker container prune -f"
echo "==> sudo docker image prune -af"
