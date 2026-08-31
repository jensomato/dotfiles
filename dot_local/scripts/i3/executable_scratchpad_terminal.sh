#!/usr/bin/env bash
mark=$(i3-msg -t get_tree | jq -r '.. | select(.focused? == true) | .marks | .[]')
case $mark in
	sp_*)
		~/.local/scripts/i3/i3run.sh
		;;
	*)
		~/.local/scripts/i3/i3run.sh terminal
		;;
esac
