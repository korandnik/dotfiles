#!/bin/bash

# Get the default sink (output) volume as a percentage
volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf "%d", $1 * 100}')

# Show notification using dunstify
dunstify -u normal "Volume: $volume%"

