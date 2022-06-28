#!/bin/bash

# https://www.middlewareinventory.com/blog/aws-cli-ec2/#example2

for region in $(aws ec2 describe-regions --query "Regions[*].[RegionName]" --output text);
do
    echo "###### $region #######"
    #aws ec2 describe-instances --region $region \
    #    --query "Reservations[*].Instances[*].{PublicIP:PublicIpAddress,Name:Tags[?Key=='Name']|[0].Value,Status:State.Name}" \
    #    --filters Name=instance-state-name,Values=running

    aws ec2 describe-instances --region $region \
        --query "Reservations[*].Instances[*].{PublicIP:PublicIpAddress,Name:Tags[?Key=='Name']|[0].Value,Type:InstanceType,Status:State.Name,LifeCyle:InstanceLifecycle}" \
        --filters Name=instance-state-name,Values=running \
        --output table
    echo ""
done
