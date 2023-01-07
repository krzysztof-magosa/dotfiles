export ZSH=$HOME/.zsh/omz

ZSH_THEME=""
CASE_SENSITIVE="true"
HIST_STAMPS="dd.mm.yyyy"
ZSH_CUSTOM="$HOME/.zsh/custom"

plugins=(
  fzf
  zsh-autosuggestions
)

ZSH_THEME=""
source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"

p
