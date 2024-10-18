#!/run/current-system/sw/bin/bash

# Pipewire
SOURCE=$(pamixer --list-sources | grep "Running" )
VOLUME=$(pamixer --get-volume "${SOURCE}")
SINK=$(pamixer --list-sinks | grep "Running")

if [ "${VOLUME}" == 0 ]; then
    echo "  MUTED"
    break
else
    echo "  ${VOLUME}%"
    break
fi
