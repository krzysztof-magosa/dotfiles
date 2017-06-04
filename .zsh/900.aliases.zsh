alias today='git log --since="today 00:00:00" --author="$(git config user.email)" --format=oneline | egrep "\w+ \w+-\d+" | cut -d" " -f 2-'
alias yesterday='git log --since="yesterday 00:00:00" --before="today 00:00:00" --author="$(git config user.email)" --format=oneline | egrep "\w+ \w+-\d+" | cut -d" " -f 2-'

alias cd..="cd .."
alias mc="mc -u"
alias tigs="tig status"
alias mkdir="mkdir -p"
alias e='emacsclient -a "" -nw'
alias e.='e .'
alias emacs='emacs -nw'
alias ek='killall Emacs emacs'
alias n="e '$ICLOUD_DIR/notes.txt'"
alias nn="mkdir '$ICLOUD_DIR/Notes' ; cd '$ICLOUD_DIR/Notes'"
alias akamai="curl -H 'Pragma: akamai-x-cache-on, akamai-x-cache-remote-on, akamai-x-check-cacheable, akamai-x-get-cache-key, akamai-x-get-extracted-values, akamai-x-get-nonces, akamai-x-get-ssl-client-session-id, akamai-x-get-true-cache-key, akamai-x-serial-no' -IXGET "
alias avv="ansible-vault view"
alias ave="ansible-vault edit"

if [ -d ~/.dotvm ] ; then
   alias vm="(cd ~/.dotvm && vagrant ssh)"
   alias vmup="(cd ~/.dotvm && vagrant up)"
fi

if  [ -f ~/.ssh/id_rsa.pub ] ; then
   is_osx && alias pubkey="cat ~/.ssh/id_rsa.pub | pbcopy | echo 'Public key has been copied to clipboard.'"
fi

if type "htop" >/dev/null ; then
    alias top="htop"
fi

# Go to projects repos dir
[ -d ~/projects ] && alias p="cd ~/projects"
[ -f "${ORGMODE_DIR}/todo.org" ] && alias todo="emacs ${ORGMODE_DIR}/todo.org"

# Show external IP
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# Lock the screen
is_osx && alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
