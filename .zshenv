# This file (~/.zshenv) sourced for: 
#  *Interactive login
#  *Interactive Non-login
#  *Scripts

# Make systemd-user ssh-agent socket available to all shells.
#export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

#if [ -n "$DESKTOP_SESSION" ];then
#  eval $(gnome-keyring-daemon --start)
#  export SSH_AUTH_SOCK
#fi


if [ -d ~/.texmf ] ; then
  export TEXMFHOME=~/.texmf
fi

add_to_path() {
  if [ -d "$1" ] && [[ ":PATH:" != *":$1:"* ]]; then
    export PATH="$1:${PATH:+"$PATH"}"
  fi
}

add_to_python_path() {
  if [ -d "$1" ] && [[ ":PYTHONPATH:" != *":$1:"* ]]; then
    export PYTHONPATH="$1:${PYTHONPATH:+"$PYTHONPATH"}"
  fi
}

add_to_path $HOME/.local/bin
add_to_path /opt/local/bin
add_to_path $HOME/.gem/ruby/2.2.0/bin

add_to_python_path $HOME/development/tests/globus/globus/oger

# Java options
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
