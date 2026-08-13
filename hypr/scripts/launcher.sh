#!/bin/bash

launcher=rofi

(pkill rofi || true) && "$HOME/.config/$launcher/scripts/$1.sh"
