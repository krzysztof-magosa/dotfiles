#! /usr/bin/env zsh

if [ ! -f git/.gitconfig-local ] ; then
  cp git/.gitconfig-local.template git/.gitconfig-local
  echo "Remember to fill git/.gitconfig-local with your details."
fi

stow -t $HOME \
  git \
  tig \
  neovim \
  zsh \
  misc \
  gnupg \
  ghostty \
  brew \
  bin \
  flashspace \
  linearmouse
