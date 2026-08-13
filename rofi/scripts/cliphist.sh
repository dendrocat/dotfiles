#!/bin/bash

cliphist list | rofi -dmenu -theme ~/.config/rofi/style/cliphist.rasi | cliphist decode | wl-copy
