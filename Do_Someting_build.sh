#!/bin/bash
# -------------------------------------------------------
# Automatic preparation script
# JC Yu,     June 09,2024
# -------------------------------------------------------
# IMPORTANT:
#   When use: './<this script file>  '
# -------------------------------------------------------
./1.0_Build_fboss_recursive.sh
./1.1_Build_Platform-Service.sh
./1.2_Build_qsfp-service.sh
./1.3_Build_Platform-manager.sh
./1.4_run_fboss_buid_fake_sai.sh
./1.5_Build_fboss-platform-mapping-gen.sh
./1.6_Build_other-Service.sh



