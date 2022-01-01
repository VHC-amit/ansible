#!bin/bash

#1. create a AWS SPOT instance
#2.Take that instance IP and register in DNS

# Way to initiate an instance
#aws ec2 request-spot-instances --instance-count 1 --type "persistent" --launch-specification file://spot.json --tag-specifications "ResourceType=spot-instances-request,Tags=[{Key=name,Value=frontend}]"

# Way to initiate an instance through template (template already crated in aws)

TEMP_ID="lt-074a0c36ef35a9356"
TEMP_VER=1
#aws ec2 run-instances --launch-template LaunchTemplateId=${TEMP_ID},Version=${TEMP_VER}
aws ec2 run-instances --launch-template LaunchTemplateId=${TEMP_ID},Version=${TEMP_VER}  --tag-specifications "ResourceType=spot-instances-request,Tags=[Key=Name,Value=frontend]" "ResourceType=instance,Tags=[Key=Name,Value=frontend]" | jq

# Good partice is to copy paste commands always to avoid typo
