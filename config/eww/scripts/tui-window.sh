#!/bin/sh
i3-sensible-terminal -e bash -c "i3 floating enable && i3 resize set width $1 && i3 resize set height $2 && i3 move window position mouse && $3"