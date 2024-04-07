#!/usr/bin/env bash
set_variables() {
	brightness_apollo_day=65
	brightness_apollo_transition=45
	brightness_apollo_night=30
	brightness_helo_day=140
	brightness_helo_transition=120
	brightness_helo_night=100
	color_day=06
	color_transition=06
	color_night=03
	hostname=$(hostname)
}

set_brightness_apollo() {
	ddcutil setvcp 10 "$1" --display 1
}

set_brightness_helo() {
	echo "$1" > /sys/class/backlight/amdgpu_bl0/brightness
}

set_color() {
	ddcutil setvcp 14 "$1" --display 1
}

main() {
	set_variables
	if [ "$1" = period-changed ]; then
		notify-send "period changed : \"$2\" to \"$3\""
		case $3 in
			night)
				if [[ "$hostname" == "helo" ]]; then
					set_brightness_helo $brightness_helo_night
				else
					set_brightness_apollo $brightness_apollo_night
				fi
				;;
			transition)
				if [[ "$hostname" == "helo" ]]; then
					set_brightness_helo $brightness_helo_transition
				else
					set_brightness_apollo $brightness_apollo_transition
				fi
				;;
			daytime)
				if [[ "$hostname" == "helo" ]]; then
					set_brightness_helo $brightness_helo_day
				else
					set_brightness_apollo $brightness_apollo_day
				fi
				;;
			none)
				if [[ "$hostname" == "helo" ]]; then
					set_brightness_helo $brightness_helo_day
				else
					set_brightness_apollo $brightness_apollo_day
				fi
				;;
		esac
	fi
}

main "$@"
