#!/usr/bin/env bash
set -exo pipefail

show_tab_by_id() {
  local id="$1"
  kitty @ --to "unix:$socket" focus-tab --match id:"$id"
  show_scratchpad
}

show_tab_by_title() {
  local title="$1"
  kitty @ --to "unix:$socket" focus-tab --match title:"$title"
  show_scratchpad
}

show_scratchpad() {
  local is_scratchpad_active=$(i3get -m terminal -ra)
  if [[ "$is_scratchpad_active" == "false" ]]; then
    i3-msg -q "[con_mark=terminal] scratchpad show, move position center"
  fi
}

declare_vars() {
  socket=$(netstat -lxp 2>/dev/null | grep -Po '@kitty-terminal-scratchpad-[0-9]+')
  declare -A tabs
  while read -r tab
  do
    local title=${tab##*:}
    local id=${tab%%:*}
    tabs["$title"]="$id"
    input="${input}<span color='#00FF00'>${id}</span>: <span weight='heavy'>${title}</span>\n"
  done < <(kitty @ ls --to "unix:$socket" | jq -r '.[].tabs.[] | "\(.id):\(.title)"')
}

main() {
  declare_vars
  if [[ "$1" == "" ]]; then
    echo "$input"
    selection=$(echo -e "$input" | rofi -dmenu -i -p "Select tab: " -markup-rows -format p)
    [[ "$?" -gt 0 ]] && exit 1
    local title=${selection##*: }
    local id=${selection%%: *}
  else
    local title="$1"
    local id="${tabs[$title]}"
  fi
  if [[ "$id" == "" ]]; then
    show_tab_by_title "$title"
  else
    show_tab_by_id "$id"
  fi
}

main "$@"
