#!/usr/bin/env bash

# Current Theme
theme="$HOME/.config/rofi/config.rasi"

# Options
bluelight='Blue Light Filter'
grayscale='Grayscale'
disable='Disable Filters'
back='Back'

# Pass variables to rofi dmenu
run_rofi() {
  echo -e "$bluelight\n$grayscale\n$disable\n$back" | rofi -dmenu -theme ${theme} -p "Choose the shader"
}

# Execute Command
run_cmd() {
  if [[ $1 == '--bluelight' ]]; then
    hyprshade toggle blue-light-filter
  elif [[ $1 == '--disable' ]]; then
    hyprshade off
  elif [[ $1 == '--grayscale' ]]; then
    hyprshade toggle grayscale
  elif [[ $1 == '--back' ]]; then 
    $HOME/Scripts/menu/appearance.sh
  else 
    exit 0
  fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $bluelight)
    run_cmd --bluelight
        ;;
    $disable)
    run_cmd --disable
        ;;
    $grayscale)
    run_cmd --grayscale
        ;;
    $back)
    run_cmd --back 
        ;;
esac
