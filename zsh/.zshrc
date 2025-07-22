export ZSH=$HOME/.zsh/omz

ZSH_THEME=""
CASE_SENSITIVE="true"
HIST_STAMPS="dd.mm.yyyy"
ZSH_CUSTOM="$HOME/.zsh/custom"

plugins=(
  fzf
  zsh-autosuggestions
  kubectl
)

source $ZSH/oh-my-zsh.sh

# Pure prompt
PURE_PROMPT_SYMBOL="➤"

zstyle :prompt:pure:path color '#51AEF8'
zstyle :prompt:pure:prompt:error color red
zstyle :prompt:pure:prompt:success color green
zstyle :prompt:pure:git:branch color grey
zstyle :prompt:pure:git:branch:cached color red

autoload -U promptinit; promptinit
prompt pure

