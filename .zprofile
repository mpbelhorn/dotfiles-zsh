
# -----------------------------------------------------------------------------
# Key Management Environment Variables.

# Pre oh-my-zsh key management.
# eval `keychain --quiet --agents ssh --eval id_rsa`

# PATH modifications
if [ -d $HOME/.local/bin ]; then
  export PATH=$PATH:$HOME/.local/bin
fi

export TEXMFHOME=$HOME/.texmf
if [ -d /usr/share/texlive/texmf-dist/scripts/epstopdf ]; then
  export PATH=$PATH:/usr/share/texlive/texmf-dist/scripts/epstopdf
fi

if [ -d $HOME/.latex-local ]; then
  export TEXMFHOME=$HOME/.latex-local
fi


## Modify the python path.
if [ -d $HOME/.local/lib/python/site-packages ]; then
  export PYTHONPATH=$PYTHONPATH:$HOME/.local/lib/python/site-packages
fi

