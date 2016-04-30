# oh-my-zsh stuff
antigen use oh-my-zsh
antigen bundle git
antigen bundle pip
antigen bundle brew
antigen bundle brew-cask
antigen bundle copydir
antigen bundle copyfile
antigen bundle cp # cpv
antigen bundle virtualenv
antigen bundle vagrant
antigen bundle sudo # esc-esc
antigen bundle rbenv
antigen bundle python
antigen bundle forklift # fl <enter>
antigen bundle history # hs/hsi
#antigen bundle osx
#antigen bundle common-aliases
#antigen bundle autoenv

# other stuff
#antigen bundle marzocchi/zsh-notify
#antigen bundle Tarrasch/zsh-bd
antigen bundle fcambus/ansiweather
antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen bundle mollifier/cd-gitroot
#antigen bundle bcho/Watson.zsh
antigen bundle voronkovich/gitignore.plugin.zsh # gi <lang>
antigen bundle peterhurford/git-it-on.zsh # gitit
antigen bundle Seinh/git-prune # gprune

antigen bundle b4b4r07/enhancd # cd <enter>
export ENHANCD_DISABLE_DOT=1
export ENHANCD_DISABLE_HYPHEN=1

# zsh-users stuff
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting # it must be last one

#antigen theme prikhi/molokai-powerline-zsh molokai-powerline
#antigen theme Remiii/remiii.zsh-theme remiii

#antigen theme agnoster
#export DEFAULT_USER="km"

antigen theme candy
