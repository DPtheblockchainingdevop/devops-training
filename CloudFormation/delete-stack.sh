#!/usr/bin/bash
#Shelll script for aws cloudformation
#2020 July 12

aws cloudformation delete-stack \
--stack-name $1 
# --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM"