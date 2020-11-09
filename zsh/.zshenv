# macOS calls path helper which overrides our PATH settings.
setopt no_global_rcs

export ZSH_HOME="$HOME/.zsh"
export PROJECTS_DIR="$HOME/projects"

export EDITOR="vim"
export VISUAL="vim"
export LANG="en_US.UTF-8"
# ggtags/global configuration label
export GTAGSLABEL="default"

export GOPATH=~/.go

export WORKON_HOME="$HOME/.venvs"

export PATH="$HOME/.brew/bin:$HOME/.brew/sbin:$PATH"
export PATH="$HOME/.brew/share/git-core/contrib/diff-highlight:$PATH"
export PATH="$HOME/Library/Python/3.8/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"

fpath=( ~/.zsh/functions $fpath )
autoload -U ~/.zsh/functions/*(:t)

