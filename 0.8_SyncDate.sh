#!/bin/bash
# -------------------------------------------------------
# Automatic preparation script
# JC Yu,     June 09,2024
# -------------------------------------------------------
# IMPORTANT:
#   When use: './<this script file>  '
# -------------------------------------------------------
TODAY=`date +"%Y-%m%d-%H%M"`
me_file=`basename "$0"`
cmd_line='sudo ln -sf /usr/share/zoneinfo/Asia/Taipei /etc/localtime'
echo "cmd_line=${cmd_line}"
${cmd_line}