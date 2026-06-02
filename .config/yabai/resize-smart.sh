#!/bin/bash
# Resize focused window based on which side of the screen it's on.
# Usage: resize-smart.sh j|k
#   j = shrink toward center, k = expand away from center
DIRECTION=$1

WIN=$(yabai -m query --windows --window)
WIN_X=$(echo "$WIN" | jq '.frame.x | floor')
WIN_W=$(echo "$WIN" | jq '.frame.w | floor')
WIN_CENTER=$(( WIN_X + WIN_W / 2 ))

DISPLAY=$(yabai -m query --displays --window)
DISPLAY_X=$(echo "$DISPLAY" | jq '.frame.x | floor')
DISPLAY_W=$(echo "$DISPLAY" | jq '.frame.w | floor')
MID=$(( DISPLAY_X + DISPLAY_W / 2 ))

if [ "$WIN_CENTER" -ge "$MID" ]; then
    # Right-side window — only movable edge is the left (shared with left window)
    if [ "$DIRECTION" = "j" ]; then
        yabai -m window --resize left:-50:0   # left edge left  → grow
    else
        yabai -m window --resize left:50:0    # left edge right → shrink
    fi
else
    # Left-side window — only movable edge is the right (shared with right windows)
    if [ "$DIRECTION" = "j" ]; then
        yabai -m window --resize right:-50:0  # right edge left  → shrink
    else
        yabai -m window --resize right:50:0   # right edge right → grow
    fi
fi
