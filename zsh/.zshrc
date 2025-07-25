# Initialize zinit
ZINIT_HOME="${HOME}/.local/share/zinit"
if [ ! -d "${ZINIT_HOME}" ] ; then
    git clone https://github.com/zdharma-continuum/zinit.git ${ZINIT_HOME}
fi
source ${ZINIT_HOME}/zinit.zsh

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

# Initialize completions
autoload -Uz compinit && compinit

# Pure prompt
PURE_PROMPT_SYMBOL="➤"
zstyle :prompt:pure:path color '#51AEF8'
zstyle :prompt:pure:prompt:error color red
zstyle :prompt:pure:prompt:success color green
zstyle :prompt:pure:git:branch color grey
zstyle :prompt:pure:git:branch:cached color red

# Use emacs style bindings
bindkey -e

# Load colors for ls
eval "$(gdircolors -b)"

# Completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # case insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # match color with ls
zstyle ':completion:*' menu no # avoids conflicts with fzf-tab
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --color=always -1 $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --color=always -1 $realpath'

# Aliases
alias mc="mc -u" # do not use subshell, as it's slow
alias l="eza --classify --long --header"
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
alias k="kubectl"

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

# Integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
gpgconf --launch gpg-agent

# Execute deferred autocompletions
zinit cdreplay -q
