export ZSH="$HOME/.omz"
export ZSH_CUSTOM="$HOME/.zsh"
export ZSH_THEME="pure"

export DISABLE_AUTO_UPDATE="true"
export HIST_STAMPS="dd.mm.yyyy"

plugins=(
    git
    pip
    brew
    brew-cask
    copydir
    copyfile
    cp
    virtualenv
    vagrant
    python
    forklift
    history
    osx
    history-substring-search
    zsh-autosuggestions
    async
    vi-mode
)

# https://www.johnhawthorn.com/2012/09/vi-escape-delays/
export KEYTIMEOUT=5

source $ZSH/oh-my-zsh.sh
