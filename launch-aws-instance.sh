#!bin/bash

#1. create a AWS SPOT instance
#2.Take that instance IP and register in DNS

aws ec2 request-spot-instances --instance-count 1 --type "persistent" --launch-specification file://spot.json --tag-specifications "ResourceType=instance,Tags=[{Key=name,Value=string},{Key=frontend}]"
