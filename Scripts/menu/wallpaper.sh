#!/usr/bin/env bash

# Current Theme
theme="$HOME/.config/rofi/config.rasi"

# Options
random='Random'
clear='Clear'
back='Back'

# Transition
transition_type=$(echo -e "outer\ncenter\nwipe" | shuf -n 1)
transition_angle=$(shuf -i 0-23 -n 1)

# Pass variables to rofi dmenu
run_rofi() {
  (for a in $HOME/.config/hypr/wallpapers/*; do echo -en "$(basename $a)\0icon\x1f$a\n"; done; echo -e "$random\n$clear\n$back") | rofi -dmenu -theme ${theme} -p "Choose the background"
}

# Execute Command
run_cmd() {
  if [[ $1 == '--random' ]]; then
    swww img $HOME/.config/hypr/wallpapers/$(ls $HOME/.config/hypr/wallpapers/ | shuf -n 1) --transition-type ${transition_type} --transition-step 15 --transition-angle $(( transition_angle * 15 )) && notify-send -i preferences-desktop-theme -u low "Wallpaper changed"
  elif [[ $1 == '--clear' ]]; then
    swww clear 000020
  elif [[ $1 == '--back' ]]; then 
    $HOME/Scripts/menu/appearance.sh
  else 
    swww img $HOME/.config/hypr/wallpapers/$1 --transition-type ${transition_type} --transition-step 15 --transition-angle $(( transition_angle * 15 )) && notify-send -i preferences-desktop-theme -u low "Wallpaper changed"
  fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $random)
		run_cmd --random
        ;;
    $clear)
    run_cmd --clear 
        ;;
    $back)
    run_cmd --back 
        ;;
    *)
    run_cmd ${chosen}
        ;;
esac
