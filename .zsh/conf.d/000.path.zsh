export GOPATH=~/.go
export PYTHONUSERBASE=~/.python

path=(
    /opt/homebrew/bin
    /opt/homebrew/sbin
    ~/.python/bin
    ~/.go/bin
    ~/bin
    ~/bin/haxor/bin
    ~/.bin/tig-rebase
    ~/Library/Python/2.7/bin
    ~/.rbenv/bi
    $(ruby -rubygems -e 'puts Gem.user_dir')/bin
    ~/Library/Python/2.7/bin
    $path
)
