#!/bin/zsh

xprop -spy -root _NET_ACTIVE_WINDOW | while read line; do
    id=$(cut -d ' ' -f 5 <<< $line)

    if [ "$id" = "0x0" ]; then
        echo ""
    else
        xprop -id $id WM_NAME | awk -F '"' '{print $2}'
    fi
done