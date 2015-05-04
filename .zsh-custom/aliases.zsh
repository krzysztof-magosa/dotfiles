alias tigs="tig status"
alias mkdir="mkdir -p"
alias e='$EDITOR'
alias n="cd ~/.notes"

if [ -d ~/.dotvm ] ; then
   alias vm="(cd ~/.dotvm && vagrant ssh)"
   alias vmup="(cd ~/.dotvm && vagrant up)"
fi

# Show external IP
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# Lock the screen
is_osx && alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
