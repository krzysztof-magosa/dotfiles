function is_osx() {
         [[ "$OSTYPE" =~ ^darwin ]] || return 1
}

function is_linux() {
         [[ "$OSTYPE" =~ ^linux ]] || return 1
}

function ansible_hosts() {
    pattern=$1
    mode=$2

    for core in host_vars/$~pattern/core.yml ; do
        host=$(basename $(dirname $core))
        ip=$(grep ansible_host: $core | awk '{print $NF}' | sed 's/"//g' | sed "s/'//g")

        if [ "$mode" = "a" ] ; then
            echo "$host A $ip"
        else
            echo "$host has IP $ip"
        fi
    done
}
