export ZSH="${ZDOTDIR:-$HOME}/.omz"
export ZSH_CUSTOM="${ZDOTDIR:-$HOME}/.zsh"
export ZSH_THEME="powerlevel9k/powerlevel9k" # "refined"

export DISABLE_AUTO_UPDATE="true"
export HIST_STAMPS="dd.mm.yyyy"

export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode)

plugins=(
#    git
#    pip
#    brew
#    brew-cask
#    copydir
#    copyfile
#    cp
#    virtualenv
#    vagrant
#    python
#    forklift
    history
#osx
#    history-substring-search
    zsh-autosuggestions
    async
    vi-mode
)

# https://www.johnhawthorn.com/2012/09/vi-escape-delays/
export KEYTIMEOUT=5

source $ZSH/oh-my-zsh.sh
