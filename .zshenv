export EDITOR="emacs"
export VISUAL="emacs"
export LANG="en_GB.UTF-8"
export ECLIMD="false"
export ORGMODE_DIR="$HOME/OneDrive/OrgMode"

# homebrew path
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# user bin
export PATH="$PATH:$HOME/bin"

# add tig-rebase to path
export PATH="$PATH:$HOME/.bin/tig-rebase"

# local python base
export PATH="$PATH:$HOME/Library/Python/2.7/bin"

# ggtags/global configuration label
export GTAGSLABEL="default"

if [ -d $HOME/.rbenv/bin ] ; then
    export PATH="$PATH:$HOME/.rbenv/bin"
fi
