
# ------------------------------------------------------------------------------
# Setup ZSH options.
# ------------------------------------------------------------------------------

# setopt NO_HUP            # Do not kill background jobs on exit.
setopt NOTIFY              # Report BG job status notifications immediately.
setopt INC_APPEND_HISTORY  # Insert history file entries on exec rather than exit.
setopt SHARE_HISTORY       #
setopt APPEND_HISTORY      # Use same history file for all shell instances.
setopt AUTO_RESUME         # Tries to resume command of same name.
unsetopt BG_NICE           # Do NOT nice bg commands.
setopt EXTENDED_HISTORY    # Puts timestamps in the history.

# Set/unset  shell options
unsetopt GLOB_DOTS        # Hidden .dotfiles implicitly included in glob operations.
setopt CDABLE_VARS      # If cd argument is not a dir, try things to find a matching dir.
setopt CORRECT          # Command spelling correction.
unsetopt CORRECT_ALL      # Attempt spelling corrections to all arguments.
setopt AUTO_CD          # If dir is issued as a command and is not a command, cd to that dir
setopt REC_EXACT        # In completion, always recognize exact matches.
setopt LONG_LIST_JOBS   # List jobs in long format by default.
setopt HIST_IGNORE_DUPS # Do not enter consecutavely duplicate commands into the history.
setopt EXTENDED_GLOB    # Treat special characters as glob patterns.
setopt MAIL_WARNING     # Prints warning if mail accessed since shell last checked.
unsetopt AUTO_PARAM_SLASH # Do not append a slash for autocompleted parameter directories.
setopt AUTO_LIST        # Automatically list choices for ambiguous completion.
unsetopt MENU_COMPLETE  # Do not assume an amiguous completion.
#setopt autopushd        # Automatically add new directory to stack on cd.
setopt pushdsilent      # Don't announce pushd
setopt pushdminus       # Reverse the directory stack order.
setopt pushdtohome

typeset -U dirstack     # Make sure there are no duplicates

# Autoload zsh modules when they are referenced
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -ap zsh/mapfile mapfile &>/dev/null

autoload -U compinit
autoload bashcompinit
autoload -U is-at-least
compinit
bashcompinit

# -----------------------------------------------------------------------------
# Key bindings.
# -----------------------------------------------------------------------------
#
# Keybindings are a messy business. There are several ways to find the correct
# ones given your combination of physical keyboard, shell,
# and inputrc/Xresources/environment etc.
#
# You can hard set the special keys by capturing their raw strings using
# ^V<key>
# in the terminal to escape the raw strings. Use the readout values to set
# the keys manually. If you use the same .zshrc in different environments
# or change your shell, this may(will) break.
#
# Or you can use zsh/terminfo or zsh/termcap to get the values from a
# properly installed term(info|cap) DB. Not all machines you may use will
# have these DBs installed correctly or include your terminal in them.
#
# -----------------------------------------------------------------------------
# Old Method:
# If all else fails, capture the keys raw values, save them to a file in your
# home directory, and use those to set the special keys in a consistant way
# using the zkbd module. This way, when you do change machines/environments,
# the needed file will be missing and you will be prompted to create it.
# Oh well, I guess I'll live with a bloated home dir.
#autoload zkbd
#[[ ! -f ${ZDOTDIR:-$HOME}/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE} ]] && zkbd
#source ${ZDOTDIR:-$HOME}/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE}
#
#[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
#[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
#[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
#[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
#[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
#[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
#[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history
#[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
#[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
#[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
#[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char
#------------------------------------------------------------------------------
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
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

# setup key accordingly
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      history-beginning-search-backward
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    history-beginning-search-forward
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

autoload -Uz history-beginning-search-menu
zle -N history-beginning-search-menu
bindkey "^X^X" history-beginning-search-menu

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if [[ -n ${terminfo[smkx]} ]] && [[ -n ${terminfo[rmkx]} ]]; then
  function zle-line-init () {
      echoti smkx
  }
  function zle-line-finish () {
      echoti rmkx
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

bindkey -M vicmd "i" up-line-or-history
bindkey -M vicmd "k" down-line-or-history
bindkey -M vicmd "j" vi-backward-char
bindkey -M vicmd "h" vi-insert

# ------------------------------------------------------------------------------
# Define the environment
# ------------------------------------------------------------------------------
setopt ALL_EXPORT # Export all subsequently defined parameters.

if [ -d $HOME/.ghar ]; then
  PATH=$PATH:$HOME/.ghar/bin
  source $HOME/.ghar/ghar-bash-completion.sh
fi

# Shell option settings.
TZ="America/New_York"
HISTFILE=$HOME/.zhistory
HISTSIZE=5000
SAVEHIST=5000
HOSTNAME="`hostname`"
#PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
#    vim -R -c 'set ft=man nomod nolist' -c 'set nowrap' -c 'map q :q<CR>' \
#    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
#    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""
if (( $+commands[vimpager] )); then
  PAGER='vimpager'
else
  PAGER='less'
fi
EDITOR='vim'
LC_ALL='en_US.UTF-8'
LANG='en_US.UTF-8'
LC_CTYPE=C

DIRSTACKSIZE=20
DIRSTACKFILE="${HOME}"/.zdirs

# Keep dirstack across logouts
if [[ -f ${DIRSTACKFILE} ]] && [[ ${#dirstack[*]} -eq 0 ]] ; then
    dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
    dirstack=( ${(u)dirstack} )
fi

unsetopt ALL_EXPORT # Stop exporting all variables.

# Enable zsh git prompt, if available on this machine.
if [ -d $HOME/.zsh/git-prompt ]; then
  source $HOME/.zsh/git-prompt/zshrc.sh
else
  git_super_status() {}
fi

# Enable Terminal colors
autoload -U colors && colors
autoload zsh/terminfo
if [[ "$terminfo[colors]" -gt 8 ]]; then
    colors
fi
for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
    eval C_$COLOR='$fg_no_bold[${(L)COLOR}]'
    eval C_BOLD_$COLOR='$fg_bold[${(L)COLOR}]'
done
eval C_RESET='$reset_color'

# set VIMODE according to the current mode (default “[i]”)
#VIMODE=''
#function zle-keymap-select {
#  VIMODE="${${KEYMAP/vicmd/:${C_RED}[editing]${C_RESET}}/(main|viins)/}"
#  zle reset-prompt
#}
#zle -N zle-keymap-select
precmd() {
  VIMODE=""
}
zle-keymap-select() {
  VIMODE=""
  [[ $KEYMAP = vicmd ]] && VIMODE="${C_RED}[vi mode]${C_RESET}"
  () { return $__prompt_status }
  zle reset-prompt
}
zle-line-init() {
  typeset -g __prompt_status="$?"
}
zle -N zle-keymap-select
zle -N zle-line-init

# Define the prompt.
function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo ''
}

if [ "$SSH_CLIENT" != "" ]; then
  C_HOST=${C_CYAN}
else
  C_HOST=${C_GREEN}
fi

setprompt () {
  setopt prompt_subst # Expands parameters, arithmetic and, commands in prompt.

  # Finally, let's set the prompt
  PROMPT='\
${C_YELLOW}%n${C_RESET}@${C_HOST}%m${C_RESET}\
${VIMODE}:${C_BLUE}%4(c:.../:)%3c${C_RESET}$(git_super_status)\

$(prompt_char)%(!.#.$) '
}

setprompt



# ------------------------------------------------------------------------------
# Aliases
# ------------------------------------------------------------------------------

if [ -f $HOME/.aliases ]; then
  source $HOME/.aliases
fi


# No clobber
set -o clobber # Override >|


#-------------------------------------------------------------------------------
# Functions
#-------------------------------------------------------------------------------

# Extract files from any archive
# Usage: ex <archive_name>

function ex ()
{
  if [ -f "$1" ] ; then
    case "$1" in
      *.tar)                tar xvf $1    ;;
      *.tar.bz2 | *.tbz2 )  tar xjvf $1   ;;
      *.tar.gz | *.tgz )    tar xzvf $1   ;;
      *.bz2)                bunzip2 $1    ;;
      *.rar)                unrar x $1    ;;
      *.gz)                 gunzip $1     ;;
      *.zip)                unzip $1      ;;
      *.Z)                  uncompress $1 ;;
      *.7z)                 7z x $1       ;;
      *.xz)                 tar xJvf $1   ;;
      *)   echo ""${1}" cannot be extracted via extract()" ;;
    esac
  else
    echo ""${1}" is not a valid file"
  fi
}

# Run a process in the background
function background () {
  "$@" > /dev/null 2>&1 & disown
}


# Hook chpwd.
# 1.) Share dirstack between multiple zsh instances.
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1] && cd $OLDPWD
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >!$DIRSTACKFILE
}
# -----------------------------------------------------------------------------
# Completion Styles.
# -----------------------------------------------------------------------------

zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' menu select=1 _complete _ignored _approximate
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

# Assume first part of paths is correct.
zstyle ':completion:*' accept-exact '*(N)'

# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# allow one error for every three characters typed in approximate completer
#zstyle -e ':completion:*:approximate:*' max-errors \
#    'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'

# Allow special directories to autocomplete.
# zstyle ':completion:*' special-dirs true

# this one allows only to cd to a local-directory
zstyle ':completion:*:*:cd:*' tag-order local-directories

# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

## add colors to processes for kill completion
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

# for cp, mv, rm: Add each argument only once
zstyle ':completion:*:(cp|mv|rm):*' ignore-line yes

# SSH Completion
zstyle ':completion:*:scp:*' tag-order \
  files users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:scp:*' group-order \
  files all-files users hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order \
  users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:ssh:*' group-order \
  hosts-domain hosts-host users hosts-ipaddr
zstyle '*' single-ignored show

