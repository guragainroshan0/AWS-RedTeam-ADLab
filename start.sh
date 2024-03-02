#!/bin/bash

# install terraform
git clone https://github.com/tfutils/tfenv.git ~/.tfenv
mkdir ~/bin
ln -s ~/.tfenv/bin/* ~/bin/
tfenv install 1.2.5
tfenv use 1.2.5


# create ssh key
ssh-keygen -f ~/.ssh/id_rsa_ad -P ""

# create s3 bucket
random_number=$(od -vAn -N2 -tu2 < /dev/urandom)

aws s3api create-bucket --bucket this-is-a-fake-s3-bucket-roshan-$(echo $random_number) --region eu-west-2 --create-bucket-configuration LocationConstraint=eu-west-2

cd terraform

sed -i "s/roshan-/roshan-$(echo $random_number)/" vars.tf


terraform init
terraform apply -auto-approve
