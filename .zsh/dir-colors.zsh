#if (( $+commands[dynamic-colors] )); then
#  dynamic-colors init
#  source $HOME/.dynamic-colors/completions/dynamic-colors.zsh
#fi

autoload -U colors && colors
[[ -f $HOME/.dir_colors ]] && eval $(dircolors -b $HOME/.dir_colors)
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
