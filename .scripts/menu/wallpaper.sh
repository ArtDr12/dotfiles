#!/usr/bin/env bash

# Options
random='Random\0icon\x1f~/.scripts/menu/icons/shuffle.svg'
back='Back\0icon\x1f~/.scripts/menu/icons/back.svg'

# Transition
transition_type=$(echo -e "outer\ncenter\nouter\ncenter\nwave\nwave\nwave" | shuf -n 1)
transition_angle=$(shuf -i 0-23 -n 1)

# Pass variables to rofi dmenu
run_rofi() {
  ((for a in $HOME/.config/hypr/wallpapers/*; do echo -en "$(basename $a)\0icon\x1f$a\n"; done; echo -e "$random\n$back") | rofi -dmenu -config ~/.config/rofi/wallpapers.rasi -p "Choose the background") || run_cmd --back
}

# Execute Command
run_cmd() {
  if [[ $1 == '--random' ]]; then
    awww img $HOME/.config/hypr/wallpapers/$(ls $HOME/.config/hypr/wallpapers/ | shuf -n 1) -t ${transition_type} --transition-step 15 --transition-angle $(( transition_angle * 15 )) && hyprctl notify -1 5000 "rgb(00a0ff)" "fontsize:16 Wallpaper changed"
  elif [[ $1 == '--back' ]]; then 
    $HOME/.scripts/menu/menu.sh
  else 
    awww img $HOME/.config/hypr/wallpapers/$1 -t ${transition_type} --transition-step 15 --transition-angle $(( transition_angle * 15 )) && hyprctl notify -1 5000 "rgb(0080ff)" "fontsize:16 Wallpaper changed"
  fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    "Random")
		run_cmd --random
        ;;
    "Back")
    run_cmd --back 
        ;;
    *)
    run_cmd ${chosen}
        ;;
esac
