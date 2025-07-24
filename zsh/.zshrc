# Initialize zinit
ZINIT_HOME="${HOME}/.local/share/zinit"
if [ ! -d "${ZINIT_HOME}" ] ; then
    git clone https://github.com/zdharma-continuum/zinit.git ${ZINIT_HOME}
fi
source ${ZINIT_HOME}/zinit.zsh

# Use emacs style bindings
bindkey -e

# History
HISTSIZE=10000
SAVEHIST=${HISTSIZE}
HISTFILE=${HOME}/.zsh_history
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt extended_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Prompt
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure
PURE_PROMPT_SYMBOL="➤"
zstyle :prompt:pure:path color '#51AEF8'
zstyle :prompt:pure:prompt:error color red
zstyle :prompt:pure:prompt:success color green
zstyle :prompt:pure:git:branch color grey
zstyle :prompt:pure:git:branch:cached color red

# Autocomplete even if case isn't matching
zstyle '*:completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Match autocompletion colors with ls
eval "$(gdircolors -b)"
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Aliases
alias mc="mc -u" # do not use subshell, as it's slow
alias l="eza"
alias ls="ls --color"
alias mkdir="mkdir -p"
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias g="git"
alias gr="cd \$(git rev-parse --show-toplevel)"
alias hpr="gh pr create --fill"
alias tigs="tig status"
alias top="htop"
alias p="mkdir -p ${PROJECTS_DIR} && cd ${PROJECTS_DIR}"
alias vi="nvim"
alias vim="nvim"
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Initialize completions
autoload -U compinit && compinit

# FZF
source <(fzf --zsh)
zinit light Aloxaf/fzf-tab
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
