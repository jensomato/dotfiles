#!/usr/bin/env bash
mark="$1"
program="$2"
hide_marks=$(i3-msg -t get_marks | jq ".[] | select(startswith(\"sp_\") and . != \"${mark}\")")
echo "$hide_marks"
if [[ $(i3-msg -t get_marks | grep "$mark") ]]; then
  echo "found"
  i3-msg "[con_mark=${mark}] scratchpad show, move position center"
else
  echo "not found"
  $program
  i3-msg "[con_mark=${mark}] scratchpad show, move position center"
fi

