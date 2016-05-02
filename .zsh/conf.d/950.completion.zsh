local -a dns_zones

if [ -d ~/.zsh/dns.d ] ; then
    zstyle -s ':completion:*:hosts' hosts _completion_hosts
    _completion_hosts+=($(cat ~/.zsh/dns.d/* | egrep "\w+\s+(A|CNAME)\s+" | awk '{print $1}'))
    zstyle ':completion:*:hosts' hosts $_completion_hosts
fi
