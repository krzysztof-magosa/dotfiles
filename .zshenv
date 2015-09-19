export EDITOR="emacs"
export VISUAL="emacs"
export LANG="en_GB.UTF-8"
export ECLIMD="false"
export ORGMODE_DIR="$HOME/OneDrive/OrgMode"

# brew sbin
export PATH="/usr/local/sbin:$PATH"

# user bin
export PATH="$PATH:$HOME/bin"

# add tig-rebase to path
export PATH="$PATH:$HOME/.bin/tig-rebase"

# add ansible to variables
if [ -d /opt/ansible ] ; then
    export PATH="$PATH:/opt/ansible/bin"
    export PYTHONPATH="/opt/ansible/lib:$PYTHONPATH"
    export MANPATH="/opt/ansible/docs/man:$MANPATH"
fi

if [ -d $HOME/.rbenv/bin ] ; then
    export PATH="$PATH:$HOME/.rbenv/bin"
fi
