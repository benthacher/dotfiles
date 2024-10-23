#!/bin/bash

# Look through mapping in links.txt and make symlinks
link_file="link.txt"

line_index=0
while read link_line; do
  ((line_index++))

  grep -q ':' <<< "$link_line" || { echo "[$link_file:$line_index]: Invalid syntax: missing ':'"; exit 1; }

  origin=$(cut -d: -f1 <<< $link_line | xargs)
  link=$(cut -d: -f2 <<< $link_line | xargs)

  [ -z "$origin" ] && echo "[$link_file:$line_index] Invalid syntax: missing link origin (part before ':')" && exit 1
  [ -z "$link" ] && echo "[$link_file:$line_index] Invalid syntax: missing link (part after ':')" && exit 1

  [ ! -f "$origin" ] && [ ! -d "$origin" ] && echo "[$link_file:$line_index] '$origin' no such file or directory" && exit 1

  # replace ~ with home directory
  link=$(echo "${link/\~/"$HOME"}")

  [ -f "$link" ] && echo "[$link_file:$line_index] '$link' file exists" && continue
  [ -d "$link" ] && echo "[$link_file:$line_index] '$link' folder exists" && continue

  ln -s "$PWD/$origin" "$link"
done < links.txt
