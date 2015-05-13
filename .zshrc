export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="blinks"
HIST_STAMPS="dd.mm.yyyy"
ZSH_CUSTOM=$HOME/.zsh-custom

plugins=(git)

setopt NO_CHECK_JOBS

source $ZSH/oh-my-zsh.sh

RPROMPT=""
