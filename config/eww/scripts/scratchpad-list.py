#!/usr/bin/env python
import i3ipc
import time

prev_val = ''

try:
    i3 = i3ipc.Connection()

    while True:
        count = len(i3.get_tree().scratchpad().leaves())

        val = f"[ {count} ]" if count > 0 else ""

        if val != prev_val:
            print(val, flush=True)
        
        prev_val = val
        time.sleep(0.1)

except Exception: # on any exception, don't log anything
    exit(1)