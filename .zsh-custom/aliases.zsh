alias tigs="tig status"
alias mkdir="mkdir -p"
alias e='$EDITOR'
alias n="cd ~/.notes"

if [ -d ~/.dotvm ] ; then
   alias vm="(cd ~/.dotvm && vagrant ssh)"
   alias vmup="(cd ~/.dotvm && vagrant up)"
fi

if  [ -f ~/.ssh/id_rsa.pub ] ; then
   is_osx && alias pubkey="cat ~/.ssh/id_rsa.pub | pbcopy | echo 'Public key has been copied to clipboard.'"
fi

# Go to projects repos dir
[ -d ~/projects ] && alias p="cd ~/projects"

# Show external IP
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# Lock the screen
is_osx && alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
