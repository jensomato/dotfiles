#!env bash
brightness_day=65
brightness_transition=45
brightness_night=30
set_brightness() {
	ddcutil setvcp 10 $1 --display 1
}
if [ "$1" = period-changed ]; then
	notify-send "period changed : \"$2\" to \"$3\""
	case $3 in
		night)
			set_brightness $brightness_night
			;;
		transition)
			set_brightness $brightness_transition
			;;
		daytime)
			set_brightness $brightness_day
			;;
	esac
fi
