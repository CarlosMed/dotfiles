#!/usr/bin/env bash

swww img ~/Pictures/color_scheme/gruvbox/landscape/$(ls ~/Pictures/color_scheme/gruvbox/landscape | sort -R | head -1) --transition-fps 60 --transition-type any --transition-duration 0.8
