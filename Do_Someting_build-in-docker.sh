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
./D1.1_Build_Platform-Service.sh
./D1.2_Build_qsfp-service.sh
./D1.3_Build_Platform-manager.sh
./D1.4_Build_Agent.sh
./D1.5_Build_fboss-platform-mapping-gen.sh
./D1.6_Build_other-Service.sh
./D1.7_Build_fboss.sh