#!/bin/bash

rofi \
  -show p \
  -modi p:'rofi-power-menu --choices=suspend/reboot/shutdown' \
  -font 'Hack Nerd Font Bold 16' \
  -theme-str 'listview {lines: 3; columns: 1;} window {height: 20em; width: 20em;} mainbox { orientation: vertical;} mode-switcher { enabled: false;}'
