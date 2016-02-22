#  Source order:
#  1: /etc/zshenv
# *2: ~/.zshenv
#  3: /etc/zprofile if login is True else pass
#  4: ~/.zprofile if login is True else pass
#  5: /etc/zshrc if interactive is True else pass
#  6: ~/.zshrc if interactive is True else pass
#  7: /etc/zlogin if login is True else pass
#  8: ~/.zlogin if login is True else pass

# Parse words in strings like bash.
setopt SH_WORD_SPLIT

## Ed Norton's home PGI install modules:
#/autofs/nccs-svm1_home1/norton/.modules

if test -n "$SSH_CONNECTION"; then
  if test -z "$PROFILEREAD"; then
    _SOURCED_FOR_SSH=true
    . /etc/profile > /dev/null 2>&1
    unset _SOURCED_FOR_SSH
    export LOCAL_PROFILE_FOR_SSH_READ="True"
  fi
  if [[ ! -o login ]]; then 
    . /etc/bash.bashrc > /dev/null 2>&1
    export LOCAL_NONLOGINENV_FOR_SSH_READ="True"
  fi
fi

# Let following init files know this has been read.
export LOCAL_ZSHENV_READ="True"
export ACCOUNT='stf007'
export SCRATCH=$MEMBERWORK/stf007
