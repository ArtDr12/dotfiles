#!/usr/bin/env bash

# Current Theme
theme="$HOME/.config/rofi/config.rasi"

# Options
appearance='Appearance Settings'
powermenu='Manage Session'
update='System Update'
exit='Exit'

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$appearance\n$update\n$powermenu\n$exit" | rofi -dmenu -theme ${theme} -theme-str 'inputbar { enabled: false; }'
}

# Execute Command
run_cmd() {
	if [[ $1 == '--appearance' ]]; then
    $HOME/Scripts/menu/appearance.sh
  elif [[ $1 == '--powermenu' ]]; then
    $HOME/Scripts/menu/powermenu.sh
  elif [[ $1 == '--update' ]]; then 
    kitty $HOME/Scripts/menu/update.sh
  else
    exit 0
  fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $appearance)
		run_cmd --appearance
        ;;
    $powermenu)
		run_cmd --powermenu
        ;;
    $update)
    run_cmd --update 
        ;;
    $exit)
    run_cmd
        ;;
esac
