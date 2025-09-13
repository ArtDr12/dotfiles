#!/usr/bin/env bash

# Current Theme
theme="$HOME/.config/rofi/config.rasi"

# Options
wallpaper='Change Wallpaper'
powermenu='Manage Session'
update='System Update'

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$wallpaper\n$powermenu\n$update" | rofi -dmenu -theme ${theme} -theme-str 'inputbar { enabled: false; }'
}

# Execute Command
run_cmd() {
	if [[ $1 == '--wallpaper' ]]; then
    $HOME/Scripts/wallpaper.sh
  elif [[ $1 == '--powermenu' ]]; then
    $HOME/Scripts/powermenu.sh
  elif [[ $1 == '--update' ]]; then 
    kitty $HOME/Scripts/update.sh
  else
    exit 0
  fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $wallpaper)
		run_cmd --wallpaper
        ;;
    $powermenu)
		run_cmd --powermenu
        ;;
    $update)
    run_cmd --update 
        ;;
esac
