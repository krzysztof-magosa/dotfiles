#! /usr/bin/env zsh

if [ ! -f git/.gitconfig-local ] ; then
  cp git/.gitconfig-local.template git/.gitconfig-local
  echo "Remember to fill git/.gitconfig-local with your details."
fi

stow -t $HOME \
  ansiweather \
  git \
  tig \
  vim \
  tmux \
  zsh \
  misc \
  code
