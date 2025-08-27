# macOS calls path helper which overrides our PATH settings.
setopt no_global_rcs

export PROJECTS_DIR="$HOME/Projects"

export EDITOR="vim"
export VISUAL="vim"
export LANG="en_GB.UTF-8"

eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="${PATH}:${HOME}/.bin"
export PATH="${PATH}:/opt/podman/bin"

export HOMEBREW_NO_AUTO_UPDATE=1
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
