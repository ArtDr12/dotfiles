#!/usr/bin/env bash

# Current Theme
theme="$HOME/.config/rofi/config.rasi"

# Options
shutdown='Shutdown'
reboot='Reboot'
lock='Lock'
suspend='Suspend'
logout='Logout'
back='Back'

# Ask for confirmation
confirm() {
	echo -e "Yes\nNo" | rofi -markup-rows -dmenu -mesg 'Are you Sure?' -theme ${theme} -theme-str 'inputbar { enabled: false; }'
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$shutdown\0icon\1fsystem-shutdown-symbolic.svg\n$reboot\n$lock\n$suspend\n$logout\n$back" | rofi -dmenu -theme ${theme} -theme-str 'inputbar { enabled: false; }'
}

# Execute Command
run_cmd() {
	selected="$(confirm)"
	echo "$selected"
	if [[ "$selected" =~ "Yes" ]]; then
		if [[ $1 == '--shutdown' ]]; then
			systemctl poweroff
		elif [[ $1 == '--reboot' ]]; then
			systemctl reboot
		elif [[ $1 == '--suspend' ]]; then
			systemctl suspend
		elif [[ $1 == '--logout' ]]; then
      hyprctl dispatch exit
    elif [[ $1 == '--lock' ]]; then
      hyprlock
    elif [[ $1 == '--back' ]]; then
      $HOME/Scripts/menu/menu.sh
    fi
	else
	  exit 0
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
		run_cmd --shutdown
        ;;
    $reboot)
		run_cmd --reboot
        ;;
    $lock)
    run_cmd --lock
        ;;
    $suspend)
		run_cmd --suspend
        ;;
    $logout)
		run_cmd --logout
        ;;
    $back)
    run_cmd --back 
        ;;
esac
