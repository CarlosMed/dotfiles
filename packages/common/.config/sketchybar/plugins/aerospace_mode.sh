#!/usr/bin/env bash

MODE=$(aerospace list-modes --current)

sketchybar --set $NAME label=$MODE
