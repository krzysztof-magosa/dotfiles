# Initialize zplugin
#source ${ZSH_HOME}/zplugin/zplugin.zsh
source ~/.zinit/bin/zinit.zsh

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load plugins
zinit light zpm-zsh/autoenv
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light rupa/z
zinit light caarlos0/zsh-mkc
zinit light mafredri/zsh-async
zinit light sindresorhus/pure
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-history-substring-search

source ~/.zsh/config.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/fzf.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/keyboard.zsh

# Things not eligible to be in git but shared between my computers
if [ -f ~/Nextcloud/Dotfiles/shared.zsh ] ; then
  source ~/Nextcloud/Dotfiles/shared.zsh
fi

if [ -f ~/.zsh/local.zsh ] ; then
  source ~/.zsh/local.zsh
fi
