#!/bin/bash

vol=$(./volume-get.sh)

muted_string=$(./volume-sink-status.sh || echo " (muted)")

dunstify "PulseAudio$muted_string" "Volume set to $vol" --timeout=2000 --replace=1 -h int:value:$vol

