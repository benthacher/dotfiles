#!/bin/zsh

xprop -spy -root _NET_CURRENT_DESKTOP | while read line; do
    cut -d ' ' -f3 <<< $line
done