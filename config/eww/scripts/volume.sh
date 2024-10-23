pactl set-sink-mute @DEFAULT_SINK@ toggle#!/bin/sh

if [[ -z "$1" ]]; then
	volume=$(pactl get-sink-volume @DEFAULT_SINK@ | xargs | cut -d' ' -f5 | sed 's/.\{1\}$//')

	[ "$(pactl get-sink-mute @DEFAULT_SINK@)" = "Mute: no" ] && echo $volume || echo 0
	exit
fi

if [[ "$1" = "mute" ]]; then
	pactl set-sink-mute @DEFAULT_SINK@ toggle
else
	pactl set-sink-volume @DEFAULT_SINK@ "$1%"
fi