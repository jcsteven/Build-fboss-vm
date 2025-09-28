#!/bin/bash
# -------------------------------------------------------
# Automatic preparation script
# JC Yu,     June 09,2024
# -------------------------------------------------------
# IMPORTANT:
#   When use: './<this script file>  '
# -------------------------------------------------------
./0.8_SyncDate.sh
date
sleep 2
./D1_Build_Platform-Service.sh
./D2_Build_qsfp-service.sh
./D3_Build_Platform-manager.sh
./D4_Build_Agent.sh
./D5_Build_fboss-platform-mapping-gen.sh
./D6_Build_other-Service.sh
./D7_Build_fboss.sh



