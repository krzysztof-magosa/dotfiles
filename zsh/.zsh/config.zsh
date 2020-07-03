HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# Change directory without cd
setopt AUTO_CD

# Share history between sessions
setopt SHARE_HISTORY

# Expire duplicates before unique commands
setopt HIST_EXPIRE_DUPS_FIRST

# Remove superfluous blanks from each command line being added to the history list.
setopt HIST_REDUCE_BLANKS

# Do not remember commands that start with a whitespace
setopt HIST_IGNORE_SPACE

# Do not run command by !! without verification
setopt HIST_VERIFY
