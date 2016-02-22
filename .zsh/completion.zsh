fpath=(~/.zsh/completion $fpath)

autoload -Uz compinit && compinit
autoload -Uz bashcompinit && bashcompinit

# Context format:
# :completion:function:completer:command:argument:tag


# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# Use a menu:
zstyle ':completion:*' menu select

# Use completion cache when using complete.
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

zstyle ':completion:*:default' list-prompt 'more...'

# Color all tags like ls by default.
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:options' list-colors '=^(-- *)=34'

# List latest mtimes first on cd completion.
zstyle ':completion:*:complete:cd:*' file-sort modification 

# Assume first part of paths is correct.
zstyle ':completion:*' accept-exact '*(N)'

# cd should only complete local subdirectories.
# TODO except when ../
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

