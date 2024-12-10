#!/bin/bash

# Get the current brightness level
current_brightness=$(brightnessctl get | awk '{print $1}' | sed 's/%//')

# Check the argument passed to the script
case "$1" in
    up)
        # Increase brightness by 10%
        brightnessctl set +10%
        new_brightness=$(($current_brightness + 10))
        ;;
    down)
        # Decrease brightness by 10%
        brightnessctl set 10%-
        new_brightness=$(($current_brightness - 10))
        ;;
    *)
        echo "Usage: $0 {up|down}"
        exit 1
        ;;
esac

# Send notification
dunstify "Brightness" "$new_brightness%" --icon=display-brightness-high

