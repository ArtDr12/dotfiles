#!/usr/bin/env bash

# Current Theme
theme="$HOME/.config/rofi/config.rasi"

# Options
random='Random'
fill='Fill'
back='Back'

# Transition
transition_type=$(echo -e "outer\ncenter\nouter\ncenter\nwipe\nwipe\nwipe" | shuf -n 1)
transition_angle=$(shuf -i 0-23 -n 1)

# Pass variables to rofi dmenu
run_rofi() {
  ((for a in $HOME/.config/hypr/wallpapers/*; do echo -en "$(basename $a)\0icon\x1f$a\n"; done; echo -e "$random\n$fill\n$back") | rofi -dmenu -theme ${theme} -p "Choose the background") || run_cmd --back
}

# Execute Command
run_cmd() {
  if [[ $1 == '--random' ]]; then
    swww img $HOME/.config/hypr/wallpapers/$(ls $HOME/.config/hypr/wallpapers/ | shuf -n 1) -t ${transition_type} --transition-step 15 --transition-angle $(( transition_angle * 15 )) && hyprctl notify -1 5000 "rgb(00a0ff)" "fontsize:16 Wallpaper changed"
  elif [[ $1 == '--fill' ]]; then
    $HOME/Scripts/menu/fill.sh
  elif [[ $1 == '--back' ]]; then 
    $HOME/Scripts/menu/menu.sh
  else 
    swww img $HOME/.config/hypr/wallpapers/$1 -t ${transition_type} --transition-step 15 --transition-angle $(( transition_angle * 15 )) && hyprctl notify -1 5000 "rgb(0080ff)" "fontsize:16 Wallpaper changed"
  fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $random)
		run_cmd --random
        ;;
    $fill)
    run_cmd --fill 
        ;;
    $back)
    run_cmd --back 
        ;;
    *)
    run_cmd ${chosen}
        ;;
esac
