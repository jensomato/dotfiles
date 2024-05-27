#!/usr/bin/env bash
selection=$(echo -e "reload\nrestart\nexit\nresize\nvsplit\nhsplit\ntabbed\nstacking\nsplitting\nfullscreen" | rofi -p "i3 command: " -dmenu -matching fuzzy -tokenize)

case "$selection" in
	reload)
		i3-msg reload;;
	restart)
		i3-msg restart;;
	exit)
		i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit';;
	resize)
		i3-msg mode "resize";;
	hsplit)
		i3-msg split h;;
	vsplit)
		i3-msg split v;;
	tabbed)
		i3-msg layout tabbed;;
	stacking)
		i3-msg layout stacking;;
	splitting)
		i3-msg layout toggle split;;
	fullscreen)
		i3-msg fullscreen toggle;;
	*)
		exit 1;;
esac
