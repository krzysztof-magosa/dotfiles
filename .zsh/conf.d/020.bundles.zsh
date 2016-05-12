# oh-my-zsh stuff
zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh", nice:14
zplug "plugins/git", from:oh-my-zsh, nice:10
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/brew", from:oh-my-zsh
zplug "plugins/brew-cask", from:oh-my-zsh, nice:10
zplug "plugins/copydir", from:oh-my-zsh
zplug "plugins/copyfile", from:oh-my-zsh
zplug "plugins/cp", from:oh-my-zsh # cpv
zplug "plugins/virtualenv", from:oh-my-zsh
zplug "plugins/vagrant", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh # esc-esc
zplug "plugins/rbenv", from:oh-my-zsh
zplug "plugins/python", from:oh-my-zsh
zplug "plugins/forklift", from:oh-my-zsh # fl <enter>
zplug "plugins/history", from:oh-my-zsh # hs/hsi
zplug "plugins/osx", from:oh-my-zsh

# theme
#zplug "oskarkrawczyk/honukai-iterm-zsh", nice:15 # after oh-my-zsh lib
zplug "themes/candy", from:oh-my-zsh, nice:15
#zplug "caiogondim/bullet-train-oh-my-zsh-theme"
#antigen theme Remiii/remiii.zsh-theme remiii

# other stuff
zplug "fcambus/ansiweather"
zplug "mollifier/cd-gitroot"
zplug "voronkovich/gitignore.plugin.zsh", nice:10 # gi <lang>
zplug "peterhurford/git-it-on.zsh" # gitit
zplug "Seinh/git-prune" # gprune
zplug "supercrabtree/k" # k

zplug "b4b4r07/enhancd", use:"enhancd.sh" # cd <enter>
export ENHANCD_DISABLE_DOT=1
export ENHANCD_DISABLE_HYPHEN=1

# zsh-users stuff
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions", nice:10
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", nice:19 # it must be last one
