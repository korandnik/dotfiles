#!/bin/bash

recordings_dir="$HOME/Videos/ScreenRecordings"
mkdir -p "$recordings_dir"

pidfile="/tmp/wf-recorder.pid"
outfile="$recordings_dir/recording_$(date +%Y-%m-%d_%H-%M-%S).mp4"

if [[ -f "$pidfile" ]]; then
    # Stop recording
    pid=$(cat "$pidfile")
    kill "$pid"
    rm "$pidfile"

    notify-send "📽️ Recording stopped"
    
    # Copy the actual video file to clipboard as binary
    # wl-copy --type video/mp4 < "$outfile"
    # notify-send "📋 Video copied to clipboard"

else
    # Select region with slurp
    region=$(slurp)
    if [[ -z "$region" ]]; then
        notify-send "❌ Recording cancelled"
        exit 1
    fi

    # Start recording
    wf-recorder -g "$region" -f "$outfile" &
    echo $! > "$pidfile"

    notify-send "🔴 Recording started"
fi

