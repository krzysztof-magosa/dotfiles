# profiling
#zmodload zsh/zprof

# customs
source ~/.zsh/config.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/fzf.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/keyboard.zsh

# local
if [ -f ~/.zsh/local.zsh ] ; then
  source ~/.zsh/local.zsh
fi

# autosuggestions
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_AUTOSUGGEST_MANUAL_REBIND=1
source "${ZSH_HOME}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

# z
source "${ZSH_HOME}/plugins/z/z.sh"

# prompt
fpath+="${ZSH_HOME}/plugins/pure"
autoload -U promptinit; promptinit
prompt pure
