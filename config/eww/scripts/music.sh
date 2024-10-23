#!/bin/zsh

max_len=40

playerctl --follow metadata --format '{{artist}} - {{title}}' | while read line; do
    # if the command outputs a single dash, we need to wait a little bit, then read the metadata
    if [ "$line" = "-" ]; then
        sleep 0.1
        line=$(playerctl metadata --format '{{artist}} - {{title}}')
    fi

    if [ $(wc -c <<< "$line") -gt $max_len ]; then
        line="$(cut -c1-$max_len <<< $line)..."
    fi

    echo $line
done