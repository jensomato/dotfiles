#!/bin/sh
scrot /tmp/lockscreenshot.png
convert /tmp/lockscreenshot.png -blur 0x5 /tmp/lockscreenshotblur.png
rm /tmp/lockscreenshot.png
i3lock -i /tmp/lockscreenshotblur.png
