#!/bin/sh

echo "STARTING LOGIN"
~/.config/i3/waitforX.sh

# Make sure monitors are setup right before starting polybar/picom/running wallpaper
echo "Updating monitors"
~/.screenlayout/update-monitors.sh
# Start picom
echo "Starting picom"
picom -b --config=$HOME/.config/picom/config
# Don't start polybar because the wallpaper script already does that 
# ~/.config/polybar/launch.sh

echo "Starting libinput-gestures"
libinput-gestures-setup start &

# Start dunst if it's not started already
echo "Starting dunst"
pgrep dunst || dunst &

# Start parcellite
echo "Starting Parcellite"
parcellite &

# Try to establish connections to phone through kdeconnect
kdeconnect-cli --refresh &

# Start the xsettings daemon if it's not started already
echo "Starting xsettingsd"
pgrep xsettingsd || xsettingsd &

# # Run wallpaper using the background image from lightdm
echo Running wallpaper
echo '/etc/lightdm/background-img' | $HOME/Projects/scripts/wallpaper -n

# Start eww
eww daemon
eww open bottom && eww open top

# Run the backup script on every login
# ~/Projects/scripts/backup/backup.sh

# Anytime the screen changes sizes, reload i3 to re-run update-monitors.sh
x-on-resize --config ~/.config/i3/reload.sh &

# Make sure gaps state reflects default gaps state (on)
echo "1" > "$HOME/.config/i3/gaps_state"

# create file to signal we've logged in and can run the reload script
touch ~/.config/i3/logged-in
