# Bail out early if running in automated/non-interactive context (e.g., Copilot, CI/CD)
# This prevents custom configurations from interfering with automated tools
if [[ -n "$VSCODE_GIT_IPC_HANDLE" ]] || \
   [[ -n "$VSCODE_IPC_HOOK_CLI" ]] || \
   [[ "$TERM" == "dumb" ]] || \
   [[ -n "$CI" ]]; then
    return
fi

# Plugins
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
zsh_plugins=~/.zsh_plugins.zsh
if [[ ! $zsh_plugins -nt ~/.zsh_plugins.txt ]]; then
    antidote bundle <~/.zsh_plugins.txt >$zsh_plugins
fi
source $zsh_plugins

# Initialize completions (cached for 24h)
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
    compinit
else
    compinit -C
fi

# Pure prompt (installed via brew)
autoload -Uz promptinit; promptinit
prompt pure
PURE_PROMPT_SYMBOL="➤"
zstyle :prompt:pure:path color '#51AEF8'
zstyle :prompt:pure:prompt:error color red
zstyle :prompt:pure:prompt:success color green
zstyle :prompt:pure:git:branch color grey
zstyle :prompt:pure:git:branch:cached color red

# Use emacs style bindings
bindkey -e
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# Load colors for ls
command -v gdircolors >/dev/null && eval "$(gdircolors -b)"

# Completion
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:][:lower:]}' '+l:|=* r:|=*' # case insensitive + complete from the middle
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # match color with ls
zstyle ':completion:*' menu no # avoids conflicts with fzf-tab
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --color=always -1 $realpath'

# Aliases
alias cat="bat"
alias mc="mc -u" # do not use subshell, as it's slow
alias l="eza --classify --long --header"
alias ls="eza"
alias mkdir="mkdir -p"
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias g="git"
alias gr="cd \$(git rev-parse --show-toplevel)"
alias hpr="gh pr create --fill"
alias tigs="tig status"
alias top="htop"
alias p='mkdir -p $PROJECTS_DIR && cd $PROJECTS_DIR'
alias vi="nvim"
alias vim="nvim"
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias k="kubectl"
alias kx="kubectx"
alias kn="kubens"

# History
HISTSIZE=10000
SAVEHIST=${HISTSIZE}
HISTFILE=${HOME}/.zsh_history
setopt appendhistory
setopt sharehistory
setopt extended_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# Integrations
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
eval "$(fzf --zsh)"
gpgconf --launch gpg-agent
eval "$(atuin init zsh)"
eval "$(direnv hook zsh)"
