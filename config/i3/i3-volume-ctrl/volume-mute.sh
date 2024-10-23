#!/bin/bash

pactl set-sink-mute @DEFAULT_SINK@ toggle

cd "$(dirname "$0")"

sink_status=$(./volume-sink-status.sh && echo unmuted || echo muted)

dunstify "PulseAudio" "Volume $sink_status" --timeout=2000 --replace=1