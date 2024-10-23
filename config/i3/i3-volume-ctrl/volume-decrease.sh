#!/bin/bash

cd "$(dirname "$0")"
pactl set-sink-volume @DEFAULT_SINK@ -5%

./show-volume-gui.sh
