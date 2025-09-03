#!/usr/bin/env bash

# Current Theme
theme="$HOME/.config/rofi/config.rasi"

# Options
wallpaper='Change Wallpaper'
powermenu='Manage Session'
update='System Update'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-theme ${theme} \
    -theme-str 'inputbar { enabled: false; }'
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$wallpaper\n$powermenu\n$update" | rofi_cmd
}

# Execute Command
run_cmd() {
	if [[ $1 == '--wallpaper' ]]; then
		for a in $HOME/.config/hypr/backgrounds/*; do echo -en "$(basename $a)\0icon\x1f$a\n"; done | swww img $HOME/.config/hypr/backgrounds/$(rofi -dmenu -p "Choose the background" -theme-str 'inputbar { enabled: false; }') --transition-type outer --transition-step 15 && notify-send -i preferences-desktop-theme "Wallpaper changed"
  elif [[ $1 == '--powermenu' ]]; then
     $HOME/Scripts/powermenu.sh
  elif [[ $1 == '--update' ]]; then 
      kitty $HOME/Scripts/update.sh
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
