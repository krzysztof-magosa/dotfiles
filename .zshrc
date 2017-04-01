export ZSH="$HOME/.omz"
export ZSH_CUSTOM="$HOME/.zsh"
export ZSH_THEME="kphoen"

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
    sudo
    python
    forklift
    history
    osx
    history-substring-search
)

source $ZSH/oh-my-zsh.sh
