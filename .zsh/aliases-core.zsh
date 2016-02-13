## Sysadmin
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
alias sz='source ~/.zshrc'
alias dh='dirs -v'

## Programs.
alias mann='background urxvt -e man'
alias cnt='ls -l | grep -ve "^total" | wc -l'
alias cntd='ls -l | grep -e "^d" | wc -l'
alias myq='qstat -au "$USER"'

## ls
alias ls='ls --color=auto --group-directories-first'
alias la='ls --color=auto --group-directories-first -a'
alias ll='ls --color=auto --group-directories-first -lhF'
alias lla='ls --color=auto --group-directories-first -lahF'
alias lsd='ls --color=auto --group-directories-first -d */'

## with grep
alias lsg='ls --color=auto | g'
alias lag='ls -a --color=auto | g'
alias llg='ls -lah --color=auto | g'

## Colorize grep
alias g="grep --color=always"
alias gi="grep -i --color=always"

## Confirm
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'

## Override -f
alias rmf='rm -Rfv'
alias cpf='\cp -v'
alias mvf='\mv -v'
alias rmf='rm -Rfv'

