DIR_COLORS_FILE="$HOME/.dir_colors"
if (( $+commands[gdircolors] )) && [ -f ${DIR_COLORS_FILE} ] ; then
  eval `gdircolors -b ${DIR_COLORS_FILE}`
fi

if (( $+commands[gls] )) ; then
  alias ls='gls --color=auto --classify --human-readable'

  # Color completion the same way
  zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
fi
