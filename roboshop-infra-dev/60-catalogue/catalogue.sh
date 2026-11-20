#!/bin/bash
component=$1
env=$2

dnf install ansible -y

ansible-pull \
  -U https://github.com/ksnaidu/practice.git \
  -e component=$component \
  -e env=$env \
  ansible-roboshop-roles.tf/main.yml

 