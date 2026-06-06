# macOS calls path helper which overrides our PATH settings.
setopt no_global_rcs

export PROJECTS_DIR="$HOME/Projects"

export EDITOR="nvim"
export VISUAL="nvim"
export LANG="en_GB.UTF-8"

for _brew_prefix in /opt/homebrew /home/linuxbrew/.linuxbrew "$HOME/.linuxbrew" /usr/local; do
    if [[ -x "$_brew_prefix/bin/brew" ]]; then
        eval "$("$_brew_prefix/bin/brew" shellenv)"
        break
    fi
done
unset _brew_prefix

export PATH="${PATH}:${HOME}/.bin"
export PATH="${PATH}:${HOME}/.local/bin"
export PATH="${PATH}:/opt/podman/bin"

export HOMEBREW_NO_AUTO_UPDATE=1
