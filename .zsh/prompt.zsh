# Enable zsh git prompt, if available on this machine.
if [ -d $HOME/.zsh/git-prompt ] && [[ ! -n $ORNL_HOST_UAPROD ]] ; then
  # If on a system using modules, make sure python is available.
  source $HOME/.zsh/git-prompt/zshrc.sh
else
  git_super_status() {}
fi

# Define the prompt.
function prompt_char {
    git branch >/dev/null 2>/dev/null && echo "%{±%G%}" && return
    hg root >/dev/null 2>/dev/null && echo "%{☿%G%}" && return
    echo ""
}

function set_host_color {
  if [[ -n $SSH_CLIENT ]]; then
    HOST_COLOR=${fg[cyan]}
  else
    HOST_COLOR=${fg[green]}
  fi
  return
}

# Set the prompt string.
setprompt () {
  NEWLINE=$'\n'
  set_host_color
  elements=(
    "%{${fg[yellow]}%}%n%{${reset_color}%}@"
    "%{${HOST_COLOR}%}%m%{${reset_color}%}:"
    "%{${fg[red]}%}${VIMODE}%{${reset_color}%}"
    "%{${fg[blue]}%}%4(c:.../:)%3c%{${reset_color}%}"
    '$(git_super_status)'
    "${NEWLINE}$(prompt_char)%(!.#.$) "
  )

  # Finally, let's set the prompt
  PROMPT=${(j::)elements}
}

# Update the prompt string and redraw when on init or keymap switch.
function zle-line-init zle-keymap-select {
  VIMODE=''
  [[ $KEYMAP = vicmd ]] && VIMODE='[vi mode]'
  setprompt
  zle reset-prompt
}
zle -N zle-keymap-select
zle -N zle-line-init


# Update the prompt string before each redraw.
function precmd {
  setprompt
}

setprompt

