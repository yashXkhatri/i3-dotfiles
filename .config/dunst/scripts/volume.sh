#!/bin/bash

# Get the current volume and mute status
current_volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | sed 's/%//')
mute_status=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

# Check the argument passed to the script
case "$1" in
    up)
        # Increase volume by 10%
        pactl set-sink-volume @DEFAULT_SINK@ +10%
        new_volume=$(($current_volume + 10))
        dunstify "Volume" "$new_volume%" --icon=audio-volume-high
        ;;
    down)
        # Decrease volume by 5%
        pactl set-sink-volume @DEFAULT_SINK@ -10%
        new_volume=$(($current_volume - 10))
        dunstify "Volume" "$new_volume%" --icon=audio-volume-high
        ;;
    mute)
        # Toggle mute
        if [ "$mute_status" == "yes" ]; then
            pactl set-sink-mute @DEFAULT_SINK@ 0
            dunstify "Volume" "Unmuted" --icon=audio-volume-high
        else
            pactl set-sink-mute @DEFAULT_SINK@ 1
            dunstify "Volume" "Muted" --icon=audio-volume-muted
        fi
        ;;
    *)
        echo "Usage: $0 {up|down|mute}"
        exit 1
        ;;
esac

