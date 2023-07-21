#!/bin/bash

# Function to output the volume icon based on raw_volume
function get_volume_icon() {
    local volume_level=$1
    local volume_icon=""

    if [ "$volume_level" -eq 0 ]; then
        volume_icon="󰖁  "
    elif [ "$volume_level" -lt 10 ]; then
        volume_icon="󰕿  "
    elif [ "$volume_level" -lt 30 ]; then
        volume_icon="󰕿 "
    elif [ "$volume_level" -lt 70 ]; then
        volume_icon="󰖀 "
    elif [ "$volume_level" -eq 100 ]; then
        volume_icon="󰕾"
    else
        volume_icon="󰕾 "
    fi

    echo "$volume_icon"
}

# Get the formatted volume information from the ALSA mixer
format_volume=$(amixer -c 1 sget Master | awk -F "[][]" '{print $2}' | tail -n 1)

# Extract the raw volume percentage from the formatted volume
raw_volume=$(echo "$format_volume" | awk '{sub(/%/, "", $1); print $1}')

# Get the volume icon based on raw_volume
volume_icon=$(get_volume_icon "$raw_volume")

echo "  $volume_icon $format_volume"
