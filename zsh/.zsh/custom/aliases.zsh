# Do not use subshell in mc
alias mc="mc -u"

# Create parent when needed
alias mkdir="mkdir -p"

# Show akamai info for url
alias akamai="curl -H 'Pragma: akamai-x-cache-on, akamai-x-cache-remote-on, akamai-x-check-cacheable, akamai-x-get-cache-key, akamai-x-get-extracted-values, akamai-x-get-nonces, akamai-x-get-ssl-client-session-id, akamai-x-get-true-cache-key, akamai-x-serial-no' -IXGET "

# Ansible
alias avv="$HOME/.bin/ansible-inline-vault-view"
alias ave="ansible-vault-encrypt-oneline-string"
alias avec="ansible-vault-encrypt-oneline-string | pbcopy"
alias avd="sed -E 's/^[ \t]+//g' | ansible-vault decrypt 2>/dev/null"
alias aves="ansible-vault encrypt_string"

# Use colors for grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Git
alias g="git"
alias grb="comm -13 <(git branch -r | sed 's@origin/@@'g | awk '{print \$1}' | sort) <(git branch -l | sed 's/*//g' |  awk '{print \$1}')"
alias gr="cd \$(git rev-parse --show-toplevel)"
alias hpr="hub pull-request"
alias tigs="tig status"

# Handy alias to copy public key
if  [ -f ~/.ssh/id_rsa.pub ] && is_osx ; then
   alias pubkey="cat ~/.ssh/id_rsa.pub | pbcopy | echo 'Public key has been copied to clipboard.'"
fi

# Use htop if available
if command -v htop &>/dev/null ; then
    alias top="htop"
fi

# Go to projects repos dir
alias p="mkdir -p ${PROJECTS_DIR}; cd ${PROJECTS_DIR}"

# Show external IP
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# Use GNU ls if available
if command -v gls &>/dev/null ; then
  alias gls="gls --color=auto --group-directories-first"
  alias ls="gls"
  alias ll="ls -lhF"
  alias la="ls -lhFa"
  alias l="ll"
fi

# Use NeoVIM if available
if command -v nvim &>/dev/null ; then
  alias vi="nvim"
  alias vim="nvim"
fi

# Handy cd..
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
