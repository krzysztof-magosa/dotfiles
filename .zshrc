DOT_ZSH="$HOME/.zsh"

if [ ! -d $DOT_ZSH/antigen ] ; then
    git clone https://github.com/zsh-users/antigen.git $DOT_ZSH/antigen
fi

source $DOT_ZSH/antigen/antigen.zsh

for file in $DOT_ZSH/conf.d/*.zsh ; do
    source $file
done

antigen apply
