#!/bin/zsh

#  | tr ', ' '\n' | sort -n | xargs | tr ' ' ','

xprop -spy -root _NET_DESKTOP_NAMES | while read line; do
    echo "[$(cut -d ' ' -f3- <<< $line)]"
done