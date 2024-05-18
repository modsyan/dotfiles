#!/bin/sh

DEFAULT_SOURCE_INDEX=$(pactl list sources short | grep -i "fallback" | awk '{print $1}')

display_volume() {
    if [ -z "$DEFAULT_SOURCE_INDEX" ]; then
        echo "No Mic Found"
    else
        volume=$(pactl list sources | awk -v idx="$DEFAULT_SOURCE_INDEX" '$1 == "Volume:" && $2 == idx {print $5}')
        mute=$(pactl list sources | awk -v idx="$DEFAULT_SOURCE_INDEX" '$1 == "Mute:" && $2 == idx {print $2}')

        volume=$(echo "$volume" | tr -d '[:space:]')

        if [ "$mute" = "yes" ]; then
            echo "[$volume]"
        elif [ "$mute" = "no" ]; then
            echo "$volume"
        else
            echo "$volume !"
        fi
    fi
}

case $1 in
    "show-vol")
        if [ -z "$2" ]; then
            volume=$(pactl list sources | grep "index: $DEFAULT_SOURCE_INDEX" -A 7 | grep "volume" | awk -F/ '{print $2}')
            mute=$(pactl list-sources | grep "index: $DEFAULT_SOURCE_INDEX" -A 11 | grep "muted")
            display_volume
        else
            volume=$(pactl list sources | grep "$2" -A 6 | grep "volume" | awk -F/ '{print $2}')
            mute=$(pactl list sources | grep "$2" -A 11 | grep "muted")
            display_volume
        fi
        ;;
    "inc-vol")
        if [ -z "$2" ]; then
            pactl set-source-volume $DEFAULT_SOURCE_INDEX +7%
        else
            pactl set-source-volume $2 +7%
        fi
        ;;
    "dec-vol")
        if [ -z "$2" ]; then
            pactl set-source-volume $DEFAULT_SOURCE_INDEX -7%
        else
            pactl set-source-volume $2 -7%
        fi
        ;;
    "mute-vol")
        if [ -z "$2" ]; then
            pactl set-source-mute $DEFAULT_SOURCE_INDEX toggle
        else
            pactl set-source-mute $2 toggle
        fi
        ;;
    *)
        echo "Invalid script option"
        ;;
esac
