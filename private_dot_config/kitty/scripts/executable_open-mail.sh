#!/usr/bin/env bash
mid=${1#mail://}
path=$(rg -l "$mid" ~/.local/share/mail | sort | head -1)
if [[ -n $path ]]; then
	aerc :preview "$path"
	$HOME/.local/scripts/i3/scratchpads.sh mail
else
	notify-send "No E-Mail found with Message-Id: $1"
fi
