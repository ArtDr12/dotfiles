#!/usr/bin/env bash

# Options
wallpaper='Change Wallpaper'
powermenu='Manage Session'
update='System Update'
shaders='Shaders'
exit='Exit'

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$wallpaper\n$update\n$powermenu\n$shaders\n$exit" | rofi -dmenu -theme-str 'inputbar { enabled: false; }'
}

# Execute Command
run_cmd() {
	if [[ $1 == '--wallpaper' ]]; then
    $HOME/.scripts/menu/wallpaper.sh
  elif [[ $1 == '--powermenu' ]]; then
    $HOME/.scripts/menu/powermenu.sh
  elif [[ $1 == '--update' ]]; then 
    kitty $HOME/.scripts/update.sh
  elif [[ $1 == '--shaders' ]]; then
    $HOME/.scripts/menu/shaders.sh
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
    $shaders)
    run_cmd --shaders 
        ;;
    $exit)
    run_cmd
        ;;
esac
