#!/bin/bash

pactl get-sink-volume @DEFAULT_SINK@ | xargs | cut -d' ' -f5
