# Enable zsh git prompt, if available on this machine.
if [ -d $HOME/.zsh/git-prompt ] && [[ ! -n $ORNL_HOST_UAPROD && -n ${commands[git]} ]]; then
  # If on a system using modules, make sure python is available.
  source $HOME/.zsh/git-prompt/zshrc.sh
else
  setopt PROMPT_SUBST
  git_super_status() {}
fi

# Define the prompt.
function prompt_char {
    PROMPT_CHAR=""
    git branch >/dev/null 2>/dev/null && PROMPT_CHAR="%{±%G%}" && return
    hg root >/dev/null 2>/dev/null && PROMPT_CHAR="%{☿%G%}" && return
}

if [[ -n $SSH_CLIENT ]]; then
  HOST_COLOR=${fg[cyan]}
else
  HOST_COLOR=${fg[green]}
fi

NEWLINE=$'\n'

# setopt PROMPT_SUBST + single quotes re-evaluates this line each call
PROMPT='%{${fg[yellow]}%}%n%{${reset_color}%}@%{${HOST_COLOR}%}%m%{${reset_color}%}:%{${fg[red]}%}${VIMODE}%{${reset_color}%}%{${fg[blue]}%}%4(c:.../:)%3c%{${reset_color}%}%{ $(git_super_status)%}${NEWLINE}$(prompt_char)%(!.#.$) '

# Update the prompt string and redraw when on init or keymap switch.
function zle-line-init zle-keymap-select {
  VIMODE=''
  [[ $KEYMAP = vicmd ]] && VIMODE='[vi mode]'
  zle reset-prompt
}
zle -N zle-keymap-select
zle -N zle-line-init

