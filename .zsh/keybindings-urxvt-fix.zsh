if [[ "$TERM" == "rxvt-unicode-256color" ]]; then
  # Special key fixes
  bindkey "${terminfo[khome]}" beginning-of-line
  bindkey "${terminfo[kend]}" end-of-line
  bindkey "${terminfo[kdch1]}" delete-char
  bindkey -M vicmd "${terminfo[khome]}" beginning-of-line
  bindkey -M vicmd "${terminfo[kend]}" end-of-line
  bindkey -M vicmd "${terminfo[kdch1]}" delete-char

  # ViM normal mode bindings.
  bindkey -M main '^[' vi-cmd-mode
  bindkey -M vicmd "i" up-line-or-history
  bindkey -M vicmd "k" down-line-or-history
  bindkey -M vicmd "j" vi-backward-char
  bindkey -M vicmd "h" vi-insert
fi
