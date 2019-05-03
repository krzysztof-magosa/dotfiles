# Initialize zplugin
source ${ZSH_HOME}/zplugin/zplugin.zsh
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

# Load plugins
zplugin light zsh-users/zsh-completions
zplugin light zsh-users/zsh-autosuggestions
zplugin light rupa/z
zplugin light caarlos0/zsh-mkc
zplugin light mafredri/zsh-async
zplugin light sindresorhus/pure
zplugin light zdharma/fast-syntax-highlighting
zplugin light zsh-users/zsh-history-substring-search

source ~/.zsh/config.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/grc.zsh
source ~/.zsh/fzf.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/keyboard.zsh

if [ -f ~/.zsh/local.zsh ] ; then
  source ~/.zsh/local.zsh
fi
