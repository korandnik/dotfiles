#!/bin/bash

CACHE_FILE="$HOME/.cache/kb_layouts"
LAYOUTS=(us ru)

if [[ -f "$CACHE_FILE" ]]; then
    INDEX=$(<"$CACHE_FILE")
else
    INDEX=0
fi

INDEX=$(( (INDEX + 1) % ${#LAYOUTS[@]} ))
echo "$INDEX" > "$CACHE_FILE"

DEVICE_NAME="at-translated-set-2-keyboard"
DEVICE_NAME_1="sonix-gaming-keyboard"
DEVICE_NAME_2="sonix-gaming-keyboard-1"
DEVICE_NAME_3="sonix-gaming-keyboard-2"
DEVICE_NAME_4="ergohaven-hpd-v2"
DEVICE_NAME_5="ergohaven-hpd-v2-keyboard"
DEVICE_NAME_6="ergohaven-hpd-v2-consumer-control"
DEVICE_NAME_7="ergohaven-hpd-v2-system-control"


hyprctl switchxkblayout "$DEVICE_NAME" ${INDEX}
hyprctl switchxkblayout "$DEVICE_NAME_1" ${INDEX}
hyprctl switchxkblayout "$DEVICE_NAME_2" ${INDEX}
hyprctl switchxkblayout "$DEVICE_NAME_3" ${INDEX}
hyprctl switchxkblayout "$DEVICE_NAME_4" ${INDEX}
hyprctl switchxkblayout "$DEVICE_NAME_5" ${INDEX}
hyprctl switchxkblayout "$DEVICE_NAME_6" ${INDEX}
hyprctl switchxkblayout "$DEVICE_NAME_7" ${INDEX}
