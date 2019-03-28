export BREW_PREFIX="$(brew --prefix)"

source <(antibody init)
antibody bundle < ~/.zsh/plugins.txt

source ~/.zsh/config.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/grc.zsh
source ~/.zsh/fzf.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/keyboard.zsh
source ~/.zsh/local.zsh
