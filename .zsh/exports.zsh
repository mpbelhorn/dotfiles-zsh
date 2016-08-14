# Locale Settings
#export LC_ALL='en_US.UTF-8'
#export LANG='en_US.UTF-8'
#export LC_CTYPE=C

# Pushd directory stack
export DIRSTACKSIZE=20
export DIRSTACKFILE=$HOME/.zdirs

# Persist stack across logouts.
if [[ -f ${DIRSTACKFILE} ]] && [[ ${#dirstack[*]} -eq 0 ]] ; then
    dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
    dirstack=( ${(u)dirstack} )
fi

if (( $+commands[vimpager] )); then
  export PAGER='vimpager'
else
  export PAGER='less'
fi
export EDITOR='vim'

export HISTSIZE=5000
export SAVEHIST=5000
export HISTFILE=$HOME/.zhistory

# Completion lists will only prompt to continue if the terminal will scroll.
export LISTMAX=0

if [[ -n "${TMUX}" && -n "${commands[tmux]}" ]];then
  case $(tmux showenv TERM 2>/dev/null) in
    *256color) ;&
      TERM=fbterm)
        TERM=screen-256color ;;
    *)
      TERM=screen
  esac
fi
