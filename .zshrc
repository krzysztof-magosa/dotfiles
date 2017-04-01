DOT_ZSH="$HOME/.zsh"
CONF_FILES=($DOT_ZSH/conf.d/*.zsh(N))
LOCAL_FILES=($DOT_ZSH/local.d/*.zsh(N))

if [ ! -d $DOT_ZSH/zplug ] ; then
    git clone https://github.com/b4b4r07/zplug.git $DOT_ZSH/zplug
fi

source $DOT_ZSH/zplug/init.zsh
source $DOT_ZSH/bundles.zsh

if ! zplug check ; then
    echo "Configuration files have been changed, installing missing plugins..."
    zplug install
fi

zplug load

for file in $CONF_FILES ; do
    source $file
done

for file in $LOCAL_FILES ; do
    source $file
done

