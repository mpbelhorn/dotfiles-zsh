# https://github.com/blinks zsh theme

function _prompt_char() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    echo "%{%F{bkg}%}±%{%f%k%b%}"
  else
    echo ''
  fi
}

# This theme works with both the "dark" and "light" variants of the
# Solarized color schema.  Set the SOLARIZED_THEME variable to one of
# these two values to choose.  If you don't specify, we'll assume you're
# using the "dark" variant.

case ${SOLARIZED_THEME:-dark} in
    light) bkg=white;;
    *)     bkg=black;;
esac

# Color prompt hostname differently if a remote host.
function _hostcolor() {
  if [ -z "${SSH_CLIENT}" ]; then
    echo "%{%F{green}%}"
  else
    echo "%{%F{cyan}%}"
  fi
}

ZSH_THEME_GIT_PROMPT_SEPARATOR="%{%F{bkg}%}|"
ZSH_THEME_GIT_PROMPT_PREFIX=" [%{%F{bkg}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%F{bkg}%}]"
ZSH_THEME_GIT_PROMPT_BRANCH="%{%F{magenta}%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{%F{green}%}%{%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{%F{red}%}%{x%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{%F{yellow}%}%{+%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{%F{green}%}OK"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{%F{blue}%}%{?%G%}"

PROMPT='%{%f%k%b%}
%{%F{yellow}%}%n%{%F{bkg}%}@$(_hostcolor)%m%{%F{bkg}%}:%{%F{blue}%}%~%{%F{bkg}%}$(git_super_status)$(vi_mode_prompt_info)%{%f%k%b%}
$(_prompt_char)%(!.#.$)%{%f%k%b%} '

#RPROMPT='!%{%b%F{bkg}%}%!%{%f%k%b%}'
RPROMPT=''
