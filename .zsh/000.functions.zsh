function is_osx() {
         [[ "$OSTYPE" =~ ^darwin ]] || return 1
}

function is_linux() {
         [[ "$OSTYPE" =~ ^linux ]] || return 1
}

function ansible_hosts() {
    pattern=$1
    port=$2

    if [ "${port}" != "" ] ; then
      port_text=", port ${port}"
    else
      port_text=""
    fi

    for core in host_vars/$~pattern/core.yml ; do
        host=$(basename $(dirname $core))
        ip=$(grep ansible_host: $core | awk '{print $NF}' | sed 's/"//g' | sed "s/'//g")

        echo "* ${host} [${ip}]${port_text}"
    done
}
