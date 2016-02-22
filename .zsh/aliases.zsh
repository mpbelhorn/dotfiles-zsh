# Sysadmin
alias su='su -' # switching users should be done into new login shells.
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
alias q='clear; exit'
alias sz='source ~/.zshrc'
alias dh='dirs -v'
alias taill='tail -n +0'
alias taillf='tail -n +0 -f'

# OLCF
alias smithy_env='module unload python; source /sw/tools/smithy/environment.sh'
alias ipy='module load python_ipython; ipython'
alias wgett='wget --no-check-certificate'
alias rsa='cat /data/log/hosts/today/rsa1.ccs.ornl.gov/user.log | egrep -i'
alias gocli='ssh gocli'

## Batch System
alias myq='qstat -au "$USER"'

## Environment Modules
alias mlo='module load'
alias mun='module unload'
alias msw='module swap'
alias mli='module list'
alias mll='module list -l'
alias msh='module show'
alias mav='module avail'
alias mhe='module help'

# Programs.
alias cnt='ls -l | grep -ve "^total" | wc -l'
alias cntd='ls -l | grep -e "^d" | wc -l'
alias vimp='vimpager'

# ls
alias ls='ls --color=auto --group-directories-first'
alias la='ls -a --color=auto --group-directories-first'
alias ll='ls -lhF --color=auto --group-directories-first'
alias lla='ls -lahF --color=auto --group-directories-first'
alias lsd='ls -d */'

# with grep
alias lsg='ls --color=auto | g'
alias lag='ls -a --color=auto | g'
alias llg='ls -lah --color=auto | g'

# Colorize grep
alias g="grep --color=always"
alias gi="grep -i --color=always"

# Confirm
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'

# Override -f
alias rmf='rm -Rfv'
alias cpf='\cp -v'
alias mvf='\mv -v'
alias rmf='rm -Rfv'

# Remote connection commands.
alias proxy_uc='ssh -fqN proxy.earth'
alias proxy_home='ssh -fqN proxy.home'
alias mint-forward='ssh -fN pass.mint'

