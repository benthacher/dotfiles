#!/bin/sh

state_file="$HOME/.config/i3/gaps_state"

if [[ $(cat $state_file) == 1 ]]; then
	i3-msg gaps outer all set 0
	i3-msg gaps inner all set 0
	echo "0" > $state_file
else
	i3-msg gaps outer all set 10
	i3-msg gaps inner all set 20
	echo "1" > $state_file
fi
