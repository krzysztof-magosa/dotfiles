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
    sudo
    python
    forklift
    history
    osx
    history-substring-search
    zsh-autosuggestions
    async
)

source $ZSH/oh-my-zsh.sh
