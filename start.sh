#!/bin/bash

# create ssh key
ssh-keygen -f ~/.ssh/id_rsa -P ""

# create s3 bucket
aws s3api create-bucket --bucket this-is-a-fake-s3-bucket-roshan --region eu-west-2

cd terraform
terraform init
terraform apply -auto-approve
