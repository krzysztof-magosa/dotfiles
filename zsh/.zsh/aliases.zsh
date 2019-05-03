alias today='git log --since="today 00:00:00" --author="$(git config user.email)" --format=oneline | egrep "\w+ \w+-\d+" | cut -d" " -f 2-'
alias yesterday='git log --since="yesterday 00:00:00" --before="today 00:00:00" --author="$(git config user.email)" --format=oneline | egrep "\w+ \w+-\d+" | cut -d" " -f 2-'

alias g="git"
alias cd..="cd .."
alias mc="mc -u"
alias tigs="tig status"
alias mkdir="mkdir -p"
alias akamai="curl -H 'Pragma: akamai-x-cache-on, akamai-x-cache-remote-on, akamai-x-check-cacheable, akamai-x-get-cache-key, akamai-x-get-extracted-values, akamai-x-get-nonces, akamai-x-get-ssl-client-session-id, akamai-x-get-true-cache-key, akamai-x-serial-no' -IXGET "
alias avv="$HOME/.bin/ansible-inline-vault-view"
alias ave="ansible-vault-encrypt-oneline-string"
alias avec="ansible-vault-encrypt-oneline-string | pbcopy"
alias avd="sed -E 's/^[ \t]+//g' | ansible-vault decrypt 2>/dev/null"
alias aves="ansible-vault encrypt_string"
alias hpr="hub pull-request"
alias grb="comm -13 <(git branch -r | sed 's@origin/@@'g | awk '{print \$1}' | sort) <(git branch -l | sed 's/*//g' |  awk '{print \$1}')"

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

if  [ -f ~/.ssh/id_rsa.pub ] && is_osx ; then
   alias pubkey="cat ~/.ssh/id_rsa.pub | pbcopy | echo 'Public key has been copied to clipboard.'"
fi

if type "htop" >/dev/null ; then
    alias top="htop"
fi

# Go to projects repos dir
if [ -d ~/projects ] ; then
  alias p="cd ~/projects"
fi

# Show external IP
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# Use GNU ls if available
if command -v gls &>/dev/null ; then
  alias gls="gls --color=auto"
  alias ls="gls"
  alias ll="ls -lhF"
  alias la="ls -lhFa"
  alias l="ll"
fi

# Handy cd..
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

function ansible-vault-encrypt-oneline-string {
  read x
  echo -n $x | ansible-vault encrypt_string | sed -E 's/^[ \t]+//g' 2>/dev/null
}
