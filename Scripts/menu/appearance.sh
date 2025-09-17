#!/usr/bin/env bash

# Current Theme
theme="$HOME/.config/rofi/config.rasi"

# Options
wallpaper='Change Wallpaper'
shaders='Shaders'
back='Back'

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$wallpaper\n$shaders\n$back" | rofi -dmenu -theme ${theme} -theme-str 'inputbar { enabled: false; }'
}

# Execute Command
run_cmd() {
	if [[ $1 == '--wallpaper' ]]; then
    $HOME/Scripts/menu/wallpaper.sh
  elif [[ $1 == '--shaders' ]]; then
    $HOME/Scripts/menu/shaders.sh
  elif [[ $1 == '--back' ]]; then
    $HOME/Scripts/menu/menu.sh
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
    $shaders)
    run_cmd --shaders 
        ;;
    $back)
    run_cmd --back 
        ;;
esac
