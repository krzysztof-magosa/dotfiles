# macOS calls path helper which overrides our PATH settings.
setopt no_global_rcs

export ZSH_HOME="$HOME/.zsh"
export PROJECTS_DIR="$HOME/Projects"

export EDITOR="vim"
export VISUAL="vim"
export LANG="en_US.UTF-8"
# ggtags/global configuration label
export GTAGSLABEL="default"

export GOPATH=~/.go

export WORKON_HOME="$HOME/.venvs"

export PATH="$HOME/.brew/bin:$HOME/.brew/sbin:$PATH"
export PATH="$HOME/.brew/share/git-core/contrib/diff-highlight:$PATH"

for py in $HOME/Library/Python/{2..3}.{0..9}/bin ; do
  if [ -d $py ] ; then
    export PATH="$py:$PATH"
  fi
done

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"

export HOMEBREW_NO_AUTO_UPDATE=1

fpath=( ~/.zsh/functions $fpath )
autoload -U ~/.zsh/functions/*(:t)
