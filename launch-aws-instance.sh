#!bin/bash

#1. create a AWS SPOT instance
#2.Take that instance IP and register in DNS

# Way to initiate an instance
aws ec2 request-spot-instances --instance-count 1 --type "persistent" --launch-specification file://spot.json --tag-specifications "ResourceType=spot-instances-request,Tags=[{Key=name,Value=frontend}]"

# Way to initiate an instance through template
TEMP_ID=
VEMP_VER=1
aws ec2 run-instances --launch-template LaunchTemplateID=${TEMP_ID}Version=