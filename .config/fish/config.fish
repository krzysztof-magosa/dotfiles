set -xg EDITOR emacs
set -xe fish_greeting
set -xg fish_user_paths /opt/homebrew/bin /opt/homebrew/sbin ~/Library/Python/2.7/bin ~/bin

set -x LC_ALL en_GB.UTF-8
set -x LC_CTYPE en_GB.UTF-8

abbr tigs='tig status'
abbr g='git'
abbr p='cd ~/projects'
abbr ip='dig +short myip.opendns.com @resolver1.opendns.com'
abbr l='ls -lpAGh'
abbr e='emacs -nw'
abbr e.='emacs -nw .'
abbr akamai="curl -H 'Pragma: akamai-x-cache-on, akamai-x-cache-remote-on, akamai-x-check-cacheable, akamai-x-get-cache-key, akamai-x-get-extracted-values, akamai-x-get-nonces, akamai-x-get-ssl-client-session-id, akamai-x-get-true-cache-key, akamai-x-serial-no' -IXGET"
abbr pubkey='cat ~/.ssh/id_rsa.pub | pbcopy | echo "Public key has been copied to clipboard."'
abbr n='emacs "~/Library/Mobile Documents/com~apple~CloudDocs/notes.txt"'

set -g theme_display_vagrant no
set -g theme_display_hg no
set -g theme_display_vi no
set -g theme_title_display_process no
set -g theme_display_virtualenv no
set -g theme_date_format "+%A, %d %B, %H:%M"

set -g default_user km

set -g fisher_home ~/.local/share/fisherman
set -g fisher_config ~/.config/fisherman

