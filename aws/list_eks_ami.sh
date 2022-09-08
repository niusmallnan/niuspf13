#!/bin/bash

_aws_regions="cn-north-1 cn-northwest-1"

# _aws_regions="us-east-2 us-east-1 us-west-2 us-west-1 af-south-1 ap-east-1 ap-south-1 ap-northeast-1 ap-northeast-2 ap-northeast-3 ap-southeast-1 ap-southeast-2 ca-central-1 eu-central-1 eu-west-1 eu-west-2 eu-south-1 eu-west-3 eu-north-1 me-south-1 sa-east-1"

_ami_list=ami.txt

> $_ami_list

for _version in $@
do
    echo "\"$_version\": {" >> $_ami_list
    for _region in $_aws_regions
    do
        _eks_ami=`aws ssm get-parameter --no-cli-pager --name /aws/service/eks/optimized-ami/$_version/amazon-linux-2/recommended/image_id --region $_region --query "Parameter.Value" --output text`
        echo "        \"$_region\": \"$_eks_ami\"," >> $_ami_list
        sleep 1
    done
    echo "}," >> $_ami_list
done
