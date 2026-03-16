#!/usr/bin/bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers/"
# Get the name of the focused monitor with hyprctl
FOCUSED_MONITOR=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name')
# Get a random wallpaper that is not the current one
WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Apply the selected wallpaper
hyprctl hyprpaper wallpaper "$FOCUSED_MONITOR",  "$WALLPAPER"
