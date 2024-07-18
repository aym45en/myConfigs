#!/bin/bash

# Get the current volume and mute state
VOLUME=$(amixer get Master | grep -oP "\[\d+%\]" | head -1 | tr -d '[]%')
MUTE_STATE=$(amixer get Master | grep -oP "\[o.+\]" | head -1)

if [ "$MUTE_STATE" == "[off]" ]; then
  # If muted, unmute and restore previous volume
  amixer set Master "$VOLUME"% unmute
else
  # If not muted, mute and set volume to 0
  amixer set Master 0 mute
fi
