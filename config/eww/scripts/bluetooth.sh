#!/bin/sh
if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
  # echo "%{F#66ffffff}"
  echo "off"
else
  if [ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]
  then 
    echo "on"
  else
    # echo "%{F#2193ff}"
    echo "connected"
  fi
fi

