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
	#local exists=$(i3-msg -t get_marks | jq "[.[] | test(\"${mark}\")] | any")
	hide_scratchpads "$mark"
	#if [[ $exists == "false" ]]; then
	if [[ $(i3-msg -t get_marks | jq "[.[] | test(\"${mark}\")] | any") == "false" ]]; then
	  $program
	  sleep 0.5
	fi
	show_scratchpad "$mark"
}

main "$@"
