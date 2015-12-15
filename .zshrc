export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"
DEFAULT_USER=hexio
#HIST_STAMPS="dd.mm.yyyy"
ZSH_CUSTOM=$HOME/.zsh-custom

plugins=(git)

setopt NO_CHECK_JOBS
setopt NO_SHARE_HISTORY

source $ZSH/oh-my-zsh.sh

#RPROMPT=""
