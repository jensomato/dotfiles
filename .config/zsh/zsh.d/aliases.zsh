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

alias d='dirs -v | head -10 | tail -9'
alias xev-keycode="xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf '%-3s %s\n', $5, $8 }'"
