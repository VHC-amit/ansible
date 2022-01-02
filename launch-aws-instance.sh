#!bin/bash

#1. create a AWS SPOT instance
#2.Take that instance IP and register in DNS

# Way to initiate an instance
#aws ec2 request-spot-instances --instance-count 1 --type "persistent" --launch-specification file://spot.json --tag-specifications "ResourceType=spot-instances-request,Tags=[{Key=name,Value=frontend}]"

# validate whether the instance is already up and running 
aws ec2 describe-instances --filters "Name=tag:Name,Values=frontend" | jq .Reservations[].Instances[].State.Name | sed 's/"//g' | grep  -E 'running|stopped' &>/dev/null
if [ $? -eq -0 ]; then
  echo "Instance is already there"
  exit
else
  echo "Instance is not running, starting instance automatically"
fi


# Way to initiate an instance through template (template already crated in aws)
TEMP_ID="lt-074a0c36ef35a9356"
TEMP_VER=1
aws ec2 run-instances --launch-template LaunchTemplateId=${TEMP_ID},Version=${TEMP_VER}  --tag-specifications "ResourceType=spot-instances-request,Tags=[{Key=Name,Value=frontend}]" "ResourceType=instance,Tags=[{Key=Name,Value=frontend}]" | jq


