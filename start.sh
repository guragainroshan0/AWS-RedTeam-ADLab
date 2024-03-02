#!/bin/bash

# create ssh key
ssh-keygen -f ~/.ssh/id_rsa

# create s3 bucket
aws s3api create-bucket --bucket this-is-a-fake-s3-bucket-roshan --region us-east-1
