#!/bin/bash

rofi \
  -show p \
  -modi p:'rofi-power-menu --symbols-font "Symbols Nerd Font Mono"' \
  -font "JetBrains Mono NF 16" \
  -theme ~/.config/rofi/config.rasi \
  -theme-str 'listview {lines: 6;}'
