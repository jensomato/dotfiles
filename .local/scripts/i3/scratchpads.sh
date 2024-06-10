#!/usr/bin/env bash
if [[ -z "$1" ]]; then
	selection=$(echo -e "✉️ mail\n📰 news\n💾 files\n🖥️ terminal\n📅 calendar\n✅ todo\n⛈️ wetter" | rofi -p "scratchpad: " -dmenu -matching normal -tokenize)
else
	selection="$1"
fi

case "$selection" in
	*mail)
    		~/.local/scripts/i3/i3run.sh "sp_mail" "kitty -1 --class sp_mail -e aerc";;
	*news)
    		~/.local/scripts/i3/i3run.sh "sp_news" "kitty -1 --class sp_news -e newsboat";;
	*files)
    		~/.local/scripts/i3/i3run.sh "sp_fm" "kitty -1 --class sp_fm -e vifm";;
	*terminal)
		~/.local/scripts/i3/i3run.sh "sp_terminal" "kitty -1 --class sp_terminal -o listen_on=unix:@kitty-terminal-scratchpad -o allow_remote_control=socket";;
	*calendar)
    		~/.local/scripts/i3/i3run.sh "sp_calendar" "kitty -1 --class sp_calendar bash -c \"LANG=de_DE.UTF-8 khal interactive\"";;
	*todo)
    		~/.local/scripts/i3/i3run.sh "sp_todo" "kitty -1 --class sp_todo -e todo.sh fzf";;
	*wetter)
		kitty -1 --class floating bash -c "curl \"wttr.in/frankfurt?mQF2&lang=de\";read -rsn1";;
	*)
		exit 1;;
esac
