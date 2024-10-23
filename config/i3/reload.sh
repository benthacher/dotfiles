#!/bin/sh

# These commands are meant to be run if I reload i3 inplace,
# but not run on first login

# If the logged-in file doesn't exist, exit
[ ! -f "$HOME/.config/i3/logged-in" ] && exit 1

# Else, run the reload commands
# Make sure monitors are setup right before starting polybar/picom/running wallpaper
~/.screenlayout/update-monitors.sh

eww reload

# Restart picom if it's running, else start it
if [ ! -z $(pgrep picom) ]; then
    pkill -SIGUSR1 picom
else
    picom -b --config=$HOME/.config/picom/config
fi

# (re)start polybar
# ~/.config/polybar/launch.sh

# Reload connections through kdeconnect
kdeconnect-cli --refresh &
