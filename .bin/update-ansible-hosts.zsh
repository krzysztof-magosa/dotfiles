#!/bin/zsh

hosts_dir=$ZSH_CUSTOM/hosts
mkdir -p $hosts_dir
cat /dev/null > $hosts_dir/ansible
ansible all -i ~/projects/ansible/hosts/prod --list-hosts | tail -n+2 | awk '{print $1}' >> $hosts_dir/ansible
ansible all -i ~/projects/ansible/hosts/stage --list-hosts | tail -n+2 | awk '{print $1}' >> $hosts_dir/ansible
