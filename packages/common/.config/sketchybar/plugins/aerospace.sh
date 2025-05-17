#!/usr/bin/env bash

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    echo $FOCUSED_WORKSPACE
    sketchybar --set $NAME \
      background.drawing=on
 else
    sketchybar --set $NAME background.drawing=off
fi
