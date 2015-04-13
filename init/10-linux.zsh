#! /usr/bin/env zsh

is_linux || return 1

sudo apt-get update

# General stuff
sudo apt-get install tig curl emacs24-nox

# C/C++ stuff
sudo apt-get install clang

# PHP stuff
sudo apt-get install php5 php5-cli php5-common php5-curl php5-gd php5-imagick php5-mysql

# Python stuff
sudo apt-get install python-pip python-jedi python3-jedi python-virtualenv
sudo pip install elpy
sudo pip install rope

