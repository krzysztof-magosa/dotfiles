# macOS calls path helper which overrides our PATH settings.
setopt no_global_rcs

export EDITOR="vim"
export VISUAL="vim"
export LANG="en_US.UTF-8"
# ggtags/global configuration label
export GTAGSLABEL="default"

export GOPATH=~/.go

export WORKON_HOME="$HOME/.venvs"

export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/share/git-core/contrib/diff-highlight:$PATH"
export PATH="$HOME/Library/Python/2.7/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"

