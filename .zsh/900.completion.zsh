hosts_dir="$ZSH_CUSTOM/hosts"

if [ -d $hosts_dir ] ; then
    zstyle -s ':completion:*:hosts' hosts _completion_hosts
    _completion_hosts+=($(find $hosts_dir -type f -exec cat {} \;))
    zstyle ':completion:*:hosts' hosts $_completion_hosts
fi
