#!/usr/bin/env bash

# Current Theme
theme="$HOME/.config/rofi/config.rasi"

# CMDs
uptime="`uptime -p | sed -e 's/up //g' | sed -e 's/hour/hr/g' | sed -e 's/minute/min/g'`"

wallpaper='Change Wallpaper'
powermenu='Manage Session'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-theme ${theme} \
    -theme-str 'inputbar { enabled: false; }'
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$wallpaper\n$powermenu" | rofi_cmd
}

# Execute Command
run_cmd() {
	if [[ $1 == '--wallpaper' ]]; then
		for a in $HOME/.config/hypr/backgrounds/*; do echo -en "$(basename $a)\0icon\x1f$a\n"; done | swww img $HOME/.config/hypr/backgrounds/$(rofi -dmenu -p "Choose the background" -theme-str 'inputbar { enabled: false; }') --transition-type outer --transition-step 15 && notify-send -i preferences-desktop-theme "Wallpaper changed"
  elif [[ $1 == '--powermenu' ]]; then
     $HOME/Scripts/powermenu.sh
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
esac
