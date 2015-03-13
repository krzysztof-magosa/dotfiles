alias tigs="tig status"
alias mkdir="mkdir -p"
alias e='$EDITOR'

if [ -d ~/.dotvm ] ; then
   alias vm="(cd ~/.dotvm && vagrant ssh)"
fi

# Show external IP
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# Lock the screen
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
