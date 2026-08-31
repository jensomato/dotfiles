#!/usr/bin/env bash
hide_scratchpads() {
	for m in $(i3-msg -t get_marks | jq ".[] | select(startswith(\"sp_\") and . != \"${1}\")")
	do
		i3-msg "[con_mark=${m}] move scratchpad"
	done
}

show_scratchpad() {
	i3-msg "[con_mark=${1}] scratchpad show, move position center"
}

main() {
	local mark="$1"
	local program="$2"
	if [[ -z "$mark" && -z "$program" ]]
	then
		hide_scratchpads
		exit 0
	fi
	hide_scratchpads "$mark"
	if [[ $(i3-msg -t get_marks | jq "[.[] | test(\"${mark}\")] | any") == "false" ]]; then
	  eval "$program"
	  # wait for window
	  i3-msg -t subscribe '[ "window" ]'
	fi
	show_scratchpad "$mark"
}

main "$@"
