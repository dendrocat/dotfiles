#!/bin/bash

# original script: https://github.com/adi1090x/rofi/blob/master/files/powermenu/type-2/powermenu.sh

uptime="`uptime -p | sed 's/up //g'`"

# Options
lock=' '
cmd_lock="loginctl lock-session"

suspend=' '
cmd_suspend="systemctl suspend"

logout='󰍃 '
cmd_logout="hyprctl dispatch 'hl.dsp.exit()'"

shutdown='󰐥 '
cmd_shutdown="shutdown now"

reboot=' '
cmd_reboot="systemctl reboot"


# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-mesg "Uptime: $uptime" \
		-theme "$HOME/.config/rofi/style/powermenu.rasi"
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$lock\n$suspend\n$logout\n$shutdown\n$reboot" | rofi_cmd
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $lock) eval "$cmd_lock" ;;
    $suspend) eval "$cmd_suspend" ;;
    $logout) eval "$cmd_logout" ;;
    $shutdown) eval "$cmd_shutdown"	;;
    $reboot) eval "$cmd_reboot";;
esac
