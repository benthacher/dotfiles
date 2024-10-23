#!/bin/bash

i3lock \
  -i ~/Projects/scripts/resources/background.png \
  --indpos="x+290:h-120" \
  --timepos="ix-160:iy" --timestr="%H:%M:%S" \
  --datepos="tx-10:ty+25" \
  --clock --datestr="%A, %m %Y" \
  --insidecolor=00000000 --ringcolor=ffffffff --line-uses-inside \
  --keyhlcolor=$(sed -n 2p ~/.cache/wal/colors | cut -c2-)ff --bshlcolor=d23c3dff --separatorcolor=00000000 \
  --insidevercolor=ffffffff --insidewrongcolor=d23c3dff \
  --ringvercolor=ffffffff --ringwrongcolor=ffffffff \
  --radius=20 --ring-width=3 --veriftext="" --wrongtext="" \
  --layoutcolor="ffffffff" --timecolor="ffffffff" --datecolor="ffffffff" --nofork