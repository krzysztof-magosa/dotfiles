ZSH="$HOME/.zsh"

if [ ! -d $ZSH/antigen ] ; then
    git clone https://github.com/zsh-users/antigen.git $ZSH/antigen
fi

source $ZSH/antigen/antigen.zsh

for file in $ZSH/conf.d/*.zsh ; do
    source $file
done

antigen apply
