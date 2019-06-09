# Setup fzf
# ---------
  export PATH="$PATH:/opt/homebrew/opt/fzf/bin"
if [[ ! "$PATH" == *$HOME/.brew/opt/fzf/bin* ]]; then
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/.brew/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$HOME/.brew/opt/fzf/shell/key-bindings.zsh"
