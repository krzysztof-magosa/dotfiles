hosts_dir="$ZSH_CUSTOM/hosts"

if [ -d $hosts_dir ] ; then
    zstyle -s ':completion:*:hosts' hosts _completion_hosts
    _completion_hosts+=($(cat $hosts_dir/*))
    zstyle ':completion:*:hosts' hosts $_completion_hosts
fi
