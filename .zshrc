# Path to your oh-my-zsh installation.
  export ZSH=/home/matt/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="custom"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  profiles
  sudo
  ssh-agent
  git-prompt
  wd
  dirpersist
  tmux
  systemd
  vi-mode
  history-substring-search)

# User configuration

# These were added by initial OMZ but seem to be totally inappropriate
# (overwrites .zshenv and .zprofile!) so keep them here for reference but never
# uncomment them....
# export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# SSH AGENT config
zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_rsa id_rsa.globus  

# Preferred editor for local and remote sessions
if [ -z "$SSH_CONNECTION" ]; then
  export EDITOR='vim'
  export PAGER='vimpager'
else
  export EDITOR='vim'
  export PAGER='less'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Custom Bindings
autoload -U colors && colors
[[ -f $HOME/.dir_colors ]] && eval $(dircolors -b $HOME/.dir_colors)
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Home/End fix
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

# Core Aliases
## Sysadmin
alias hgit='vcsh'
alias psa='ps auxf'
alias psg='ps aux | grep'  #requires an argument
alias date='echo -ne "${LIGHTBLUE}";date "+%A %B %d, %Y %l:%M %p %Z"'
alias cal='echo -e "${CYAN}"; cal""'
alias hist='history | g $1' #Requires one input
alias du='du -sh'
alias dul='\du -h | less'
alias df='df -h'
alias nano='nano -w'
alias nanob='nano -w -B'
alias sz='source ~/.zshrc'
alias dh='dirs -v'

## Programs.
alias mann='background urxvt -e man'
alias cnt='ls -l | grep -ve "^total" | wc -l'
alias cntd='ls -l | grep -e "^d" | wc -l'
alias myq='qstat -au "$USER"'

## ls
alias ls='ls --color=auto --group-directories-first'
alias la='ls --color=auto --group-directories-first -a'
alias ll='ls --color=auto --group-directories-first -lhF'
alias lla='ls --color=auto --group-directories-first -lahF'
alias lsd='ls --color=auto --group-directories-first -d */'

## with grep
alias lsg='ls --color=auto | g'
alias lag='ls -a --color=auto | g'
alias llg='ls -lah --color=auto | g'

## Colorize grep
alias g="grep --color=always"
alias gi="grep -i --color=always"

## Confirm
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'

## Override -f
alias rmf='rm -Rfv'
alias cpf='\cp -v'
alias mvf='\mv -v'
alias rmf='rm -Rfv'

function sc() {
  ssh-add -e /usr/lib/opensc-pkcs11.so
  ssh-add -s /usr/lib/opensc-pkcs11.so
}

## # auto-update sock directory
## function _update_auth_sock() {
##   if [[ -n "${SSH_AUTH_SOCK+x}" ]]; then
##     NEW_SSH_AUTH_SOCK=$(ls -t $(find /tmp/ -user $USER -type s -regex '/tmp/ssh-.*/agent.*' 2>/dev/null ) | head -n 1)
##     if [[ "${SSH_AUTH_SOCK}" != "${NEW_SSH_AUTH_SOCK}" ]]; then
##       echo "Updating SSH_AUTH_SOCK"
##       export SSH_AUTH_SOCK="${NEW_SSH_AUTH_SOCK}"
##     fi
##   fi
## }
## alias ssh='_update_auth_sock && ssh'

# Host-specific aliases
[[ -f $HOME/.zsh/host_aliases.zsh ]] && source $HOME/.zsh/host_aliases.zsh
