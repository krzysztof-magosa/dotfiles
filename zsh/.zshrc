export ZSH=$HOME/.zsh/omz

ZSH_THEME=""
CASE_SENSITIVE="true"
HIST_STAMPS="dd.mm.yyyy"
ZSH_CUSTOM="$HOME/.zsh/custom"

plugins=(
  fzf
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

fpath+=($HOME/.zsh/plugins/pure)
zstyle :prompt:pure:path color green
source $HOME/.zsh/plugins/pure/pure.zsh

p
