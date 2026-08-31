#!/usr/bin/env bash
locker="blurlock.sh && sleep 1"
selection=$(echo -e "lock\nlogout\nsuspend\nhibernate\nreboot\nshutdown" | rofi -p "i3 command: " -dmenu -matching fuzzy -tokenize)

case "$selection" in
	lock)
    		$locker;;
	logout)
		i3-msg exit;;
	suspend)
		$locker && systemctl suspend;;
	hibernate)
		$locker && systemctl hibernate;;
	reboot)
		systemctl reboot;;
	shutdown)
		systemctl poweroff -i;;
	*)
		exit 1;;
esac
