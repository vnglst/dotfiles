#!/bin/bash

# Get the focused workspace from AeroSpace
if [ "$SENDER" = "aerospace_workspace_change" ]; then
    FOCUSED_WORKSPACE="$FOCUSED_WORKSPACE"
else
    FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)
fi

# Update all workspace indicators (1-5)
for i in {1..5}; do
    if [ "$FOCUSED_WORKSPACE" = "$i" ]; then
        sketchybar --set space.$i background.color=0xffffffff icon.color=0xff000000
    else
        sketchybar --set space.$i background.color=0x40ffffff icon.color=0xffffffff
    fi
done
