# oh-my-zsh stuff
zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh"
zplug "plugins/git", from:oh-my-zsh, defer:2
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/brew", from:oh-my-zsh
zplug "plugins/brew-cask", from:oh-my-zsh, defer:2
zplug "plugins/copydir", from:oh-my-zsh
zplug "plugins/copyfile", from:oh-my-zsh
zplug "plugins/cp", from:oh-my-zsh # cpv
#zplug "plugins/virtualenv", from:oh-my-zsh
zplug "plugins/vagrant", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh # esc-esc
#zplug "plugins/rbenv", from:oh-my-zsh
zplug "plugins/python", from:oh-my-zsh
zplug "plugins/forklift", from:oh-my-zsh # fl <enter>
zplug "plugins/history", from:oh-my-zsh # hs/hsi
zplug "plugins/osx", from:oh-my-zsh, defer:2

# various stuff
#zplug "fcambus/ansiweather"
zplug "mollifier/cd-gitroot"
zplug "voronkovich/gitignore.plugin.zsh", defer:2 # gi <lang>
#zplug "peterhurford/git-it-on.zsh" # gitit
zplug "Seinh/git-prune" # gprune
zplug "supercrabtree/k" # k
zplug "junegunn/fzf", use:"shell/*.zsh", defer:2 # fuzzy search, ctrl+t, ctrl+r, alt+c

# zsh-users stuff
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions", defer:2
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:3 # it must be last one

# theme
zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
