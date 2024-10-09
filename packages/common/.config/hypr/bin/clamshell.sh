#!/bin/bash 

if grep open /proc/acpi/button/lid/LID/state; then
  hyprctl keyword monitor "BOE 0x0791,1920x1080@60.01,auto,1"
  hyprctl keyword monitor "DP-1,disable"
  hyprctl keyword monitor "desc:LG Electronics LG HDR 4K 0x00017916,disable"
else
  if [[ $(hyprctl monitors | grep "Monitor" | wc -l) != 1 ]]; then
    hyprctl keyword monitor "eDP-1,disable"
    hyprctl keyword monitor "desc:ViewSonic Corporation XG270QG,2560x1440@59.95,auto,1"
    hyprctl keyword monitor "desc:LG Electronics LG HDR 4K 0x00017916,2560x1440@60,auto,1,transform,3"
  fi
fi
