DOT_ZSH="$HOME/.zsh"
CONF_FILES=($DOT_ZSH/conf.d/*.zsh(N))
LOCAL_FILES=($DOT_ZSH/local.d/*.zsh(N))
BUNDLES_FILES=($DOT_ZSH/bundles.zsh)
LAST_UPDATE="$DOT_ZSH/.last-update"

function is_update_needed() {
    if [ ! -f $LAST_UPDATE ] ; then
        touch $LAST_UPDATE
        return 0
    fi

    for file in $BUNDLES_FILES ; do
        if [ $file -nt $LAST_UPDATE ] ; then
            return 0
        fi
    done

    return 1
}

if [ ! -d $DOT_ZSH/zplug ] ; then
    git clone https://github.com/b4b4r07/zplug.git $DOT_ZSH/zplug
fi

source $DOT_ZSH/zplug/init.zsh
source $DOT_ZSH/bundles.zsh

if is_update_needed ; then
    if ! zplug check ; then
        echo "Configuration files have been changed, installing missing plugins..."
        zplug install
        zplug clear
    fi

    touch $LAST_UPDATE
fi

zplug load --verbose

for file in $CONF_FILES ; do
    source $file
done

for file in $LOCAL_FILES ; do
    source $file
done
