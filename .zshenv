# macOS calls path helper which overrides our PATH settings.
setopt no_global_rcs

export EDITOR="emacs"
export VISUAL="emacs"
export LANG="en_GB.UTF-8"
# ggtags/global configuration label
export GTAGSLABEL="default"

export GOPATH=~/.go
export PYTHONUSERBASE=~/.python

export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/share/git-core/contrib/diff-highlight:$PATH"
export PATH="$PYTHONUSERBASE/bin:$PATH"
export PATH="~/bin:$PATH"
export PATH="~/.bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
