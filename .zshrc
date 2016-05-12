DOT_ZSH="$HOME/.zsh"

if [ ! -d $DOT_ZSH/zplug ] ; then
    git clone https://github.com/b4b4r07/zplug.git $DOT_ZSH/zplug
fi

source $DOT_ZSH/zplug/init.zsh

for file in $DOT_ZSH/conf.d/*.zsh ; do
    source $file
done

if [ ! -d ~/.zplug/repos ] ; then
    zplug install
fi

zplug load --verbose
