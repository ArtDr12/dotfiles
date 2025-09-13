#!/usr/bin/env bash

# Options
random='Random'

# Transition
transition_type=$(echo -e "outer\ncenter\nwipe" | shuf -n 1)
transition_angle=$(shuf -i 0-23 -n 1)

# Pass variables to rofi dmenu
run_rofi() {
  (for a in $HOME/.config/hypr/backgrounds/*; do echo -en "$(basename $a)\0icon\x1f$a\n"; done && echo "Random") | rofi -dmenu -p "Choose the background"
}

# Execute Command
run_cmd() {
  if [[ $1 == '--random' ]]; then
    swww img $HOME/.config/hypr/backgrounds/$(ls $HOME/.config/hypr/backgrounds/ | shuf -n 1) --transition-type ${transition_type} --transition-step 15 --transition-angle $(( transition_angle * 15 )) && notify-send -i preferences-desktop-theme -u low "Wallpaper changed"
  else 
    swww img $HOME/.config/hypr/backgrounds/$1 --transition-type ${transition_type} --transition-step 15 --transition-angle $(( transition_angle * 15 )) && notify-send -i preferences-desktop-theme -u low "Wallpaper changed"
  fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $random)
		run_cmd --random
        ;;
    *)
    run_cmd ${chosen}
        ;;
esac
