#! /usr/bin/env zsh

is_osx || return 1

sudo port selfupdate
sudo port install tig curl emacs
