#  Source order:
#  1: /etc/zshenv
#  2: ~/.zshenv
#  3: /etc/zprofile if login is True else pass
#  4: ~/.zprofile if login is True else pass
#  5: /etc/zshrc if interactive is True else pass
#  6: ~/.zshrc if interactive is True else pass
#  7: /etc/zlogin if login is True else pass
# *8: ~/.zlogin if login is True else pass

export LOCAL_ZLOGIN_READ="True"
