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
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-history-substring-search

zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

source ~/.zsh/config.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/fzf.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/keyboard.zsh

if [ -f ~/.zsh/local.zsh ] ; then
  source ~/.zsh/local.zsh
fi
