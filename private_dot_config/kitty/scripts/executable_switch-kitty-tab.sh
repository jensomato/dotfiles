#!/usr/bin/env bash
selection=$(kitty @ ls | jq -r '.[].tabs.[] | "\(.id): \(.title)"' | rofi -dmenu -i -p "select tab: ")
title=${selection##*: }
id=${selection%%: *}
kitty @ focus-tab --match id:"$id"
