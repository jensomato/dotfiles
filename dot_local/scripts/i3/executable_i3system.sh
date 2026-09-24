#!/usr/bin/env bash
selection=$(echo -e "lock\nlogout\nsuspend\nhibernate\nreboot\nshutdown" | rofi -p "i3 command: " -dmenu -matching prefix -tokenize)

lock_screen() {
    for cmd in scrot convert i3lock xdpyinfo awk; do
        if ! command -v "$cmd" &>/dev/null; then
            echo "Error: '$cmd' is not installed." >&2
            return 127
        fi
    done

    local res
    res=$(xdpyinfo 2>/dev/null | awk '/dimensions:/ {print $2}')
    if [[ -z "$res" ]]; then
        echo "Error: resolution can not be determined." >&2
        return 1
    fi

    (
        set -o pipefail
        scrot - | convert - -scale 10% -scale 1000% RGB:- | i3lock --raw "${res}:rgb" --image /dev/stdin
    )
    return $?
}

case "$selection" in
	lock)
    		lock_screen;;
	logout)
		i3-msg exit;;
	suspend)
		lock_screen && systemctl suspend;;
	hibernate)
		lock_screen && systemctl hibernate;;
	reboot)
		systemctl reboot;;
	shutdown)
		systemctl poweroff -i;;
	*)
		exit 1;;
esac
