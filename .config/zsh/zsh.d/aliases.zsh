alias -- -='cd -'
alias 1='cd -'
alias 2='cd +2'
alias 3='cd +3'
alias 4='cd +4'
alias 5='cd +5'
alias 6='cd +6'
alias 7='cd +7'
alias 8='cd +8'
alias 9='cd +9'

alias ..='cd ..'
alias ...='cd ../..'

alias d='dirs -v | head -10 | tail -9'
alias xev-keycode="xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf '%-3s %s\n', $5, $8 }'"
alias reload='exec -l zsh'
alias k='LANG=de_DE.UTF-8 khal'
alias kc='k calendar'
alias kl='k list'
alias ki='k interactive'

alias t='todo.sh'

alias ls='ls -v --color=auto'
alias la='ls -la'
alias ll='ls -l'
alias lh='ls -hAl'
alias l='ls -l'
alias lsnew="command ls -rtlh *(D.om[1,10])"
alias lsold="command ls -rtlh *(D.Om[1,10])"
alias lsbig="command ls -flh *(.OL[1,10])"
alias lssmall="command ls -Srl *(.oL[1,10])"

alias grep='grep --color=auto'

alias lg='lazygit'

alias getkittysocket="netstat -lxp 2>/dev/null | grep -Po '@kitty-terminal-scratchpad-[0-9]+'"
