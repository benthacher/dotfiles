#!/bin/bash

[ "$(pactl get-sink-mute @DEFAULT_SINK@)" = "Mute: no" ] && exit 0 || exit 1