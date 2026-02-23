#!/usr/bin/env bash
kitty @ resize-window -i -10 -a vertical
tabs=$(kitty @ ls | jq -r '.[].tabs.[] | "\(.id): \(.title)"')
selection=$(echo -ne "$tabs" | fzf)
title=${selection##*: }
id=${selection%%: *}
kitty @ focus-tab --match id:"$id"
