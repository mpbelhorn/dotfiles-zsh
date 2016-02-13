
export ZSH=/home/matt/.oh-my-zsh # Path to oh-my-zsh installation.

ZSH_THEME="brainrot"
# DISABLE_LS_COLORS="true" # Uncomment to disable colors in ls.
# ENABLE_CORRECTION="true" # Uncomment to enable command auto-correction.
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.zsh

# Load following plugins from first available in
# $ZSH_CUSTOM/plugins/*, $ZSH/plugins/*
# Too many plugins may slow shell startup.
plugins=(
  profiles
  ssh-agent
  sudo
  git-prompt
  wd
  dirpersist
  tmux
  systemd 
  vi-mode
  history-substring-search)

# User configuration

## Modifications to the PATH should typically be done in
##   ~/.profile for general path modifications
##   ~/.zprofile for zsh-specific modifications
##   ~/.zshrc for interactive-only zsh-specific modifications

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# See $ZSH_CUSTOM/*.zsh for additional customizations.

