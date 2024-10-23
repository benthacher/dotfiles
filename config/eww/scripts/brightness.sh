#!/bin/bash

if [[ "$1" = "up" ]]; then
	brightnessctl s 5000+ > /dev/null
	exit 0
elif [[ "$1" = "down" ]]; then
	brightnessctl s 5000- > /dev/null
	exit 0
fi