#  Source order:
#  1: /etc/zshenv
#  2: ~/.zshenv
#  3: /etc/zprofile if login is True else pass
#  4: ~/.zprofile if login is True else pass
#  5: /etc/zshrc if interactive is True else pass
# *6: ~/.zshrc if interactive is True else pass
#  7: /etc/zlogin if login is True else pass
#  8: ~/.zlogin if login is True else pass


autoload -U is-at-least

if [[ -n "${commands[module]}" ]]; then
  module -s load python
  module -s load git
fi

source ~/.zsh/checks.zsh
source ~/.zsh/colors.zsh
source ~/.zsh/options.zsh

if [[ ! -n $ORNL_HOST_UAPROD ]]; then
  source ~/.zsh/exports.zsh
  source ~/.zsh/prompt.zsh
  source ~/.zsh/aliases.zsh
  source ~/.zsh/completion.zsh
  source ~/.zsh/bindkeys.zsh
  source ~/.zsh/functions.zsh
fi

source ~/.zsh/history.zsh

# Set the title
case $TERM in
  screen*)
  ;&
  xterm*)
    print -Pn "\e]0;%n@%m\a"
  ;;
esac

# Let following init files know this has been read.
export LOCAL_ZSHRC_READ="True"
