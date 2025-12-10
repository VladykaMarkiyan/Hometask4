#!/bin/bash

aws ec2 run-instances \
--image-id ami-053b0d53c279acc90 \
--count 1 \
--instance-type t3.micro \
--key-name my-key \
--security-groups my-ssh-sg \
--iam-instance-profile Name="readonly" \
--user-data file://data.sh