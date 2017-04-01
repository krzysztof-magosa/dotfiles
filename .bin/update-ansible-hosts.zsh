#!/bin/zsh

hosts_dir=$ZSH_CUSTOM/hosts
mkdir -p $hosts_dir
ansible all -i ~/projects/ansible/hosts --list-hosts | tail -n+2 | awk '{print $1}' > $hosts_dir/ansible
