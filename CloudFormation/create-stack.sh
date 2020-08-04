#!/usr/bin/bash
#Shelll script for aws cloudformation
#2020 July 12

aws cloudformation create-stack \
--stack-name $1 \
--template-body file://$2 \
--region=us-west-2 \
--parameters file://$3 \
--capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM"
