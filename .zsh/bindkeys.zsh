# Set base keybindings using terminfo data if possible.
# Terminfo is only valid in mode keyboard-transmit (mkx):
autoload -U zsh/terminfo
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  # Store terminfo keycodes in local array.
  typeset -A key
  key[Home]=${terminfo[khome]}
  key[End]=${terminfo[kend]}
  key[Insert]=${terminfo[kich1]}
  key[Delete]=${terminfo[kdch1]}
  key[Up]=${terminfo[kcuu1]}
  key[Down]=${terminfo[kcud1]}
  key[Left]=${terminfo[kcub1]}
  key[Right]=${terminfo[kcuf1]}
  key[PageUp]=${terminfo[kpp]}
  key[PageDown]=${terminfo[knp]}

  # Set the core keybindings iff terminfo provides the keycode.
  [[ -n "${key[Home]}"   ]] && bindkey "${key[Home]}"   beginning-of-line
  [[ -n "${key[End]}"    ]] && bindkey "${key[End]}"    end-of-line
  [[ -n "${key[Insert]}" ]] && bindkey "${key[Insert]}" overwrite-mode
  [[ -n "${key[Delete]}" ]] && bindkey "${key[Delete]}" delete-char
  [[ -n "${key[Up]}"     ]] && bindkey "${key[Up]}"     history-beginning-search-backward
  [[ -n "${key[Down]}"   ]] && bindkey "${key[Down]}"   history-beginning-search-forward
  [[ -n "${key[Left]}"   ]] && bindkey "${key[Left]}"   backward-char
  [[ -n "${key[Right]}"  ]] && bindkey "${key[Right]}"  forward-char
   
  # Set- and return- fron mkx on start and end of line editing.
  function zle-line-init () {
    echoti smkx
  }
  function zle-line-finish () {
    echoti rmkx
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

#Keypad
bindkey -s "^[Op" "0"
bindkey -s "^[On" "."
bindkey -s "^[OM" "^M"
bindkey -s "^[Oq" "1"
bindkey -s "^[Or" "2"
bindkey -s "^[Os" "3"
bindkey -s "^[Ot" "4"
bindkey -s "^[Ou" "5"
bindkey -s "^[Ov" "6"
bindkey -s "^[Ow" "7"
bindkey -s "^[Ox" "8"
bindkey -s "^[Oy" "9"
bindkey -s "^[Ok" "+"
bindkey -s "^[Om" "-"
bindkey -s "^[Oj" "*"
bindkey -s "^[Oo" "/"

# History bindings.
autoload -Uz history-beginning-search-menu
zle -N history-beginning-search-menu
bindkey "^X^X" history-beginning-search-menu
bindkey '^R' history-incremental-search-backward

# ViM normal mode bindings.
bindkey -M main '^[' vi-cmd-mode
bindkey -M vicmd "i" up-line-or-history
bindkey -M vicmd "k" down-line-or-history
bindkey -M vicmd "j" vi-backward-char
bindkey -M vicmd "h" vi-insert

