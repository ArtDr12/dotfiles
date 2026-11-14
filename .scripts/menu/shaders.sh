#!/usr/bin/env bash

# Options
bluelight='Blue Light Filter'
grayscale='Grayscale'
negative='Negative'
disable='Disable Filters'
back='Back'

# Pass variables to rofi dmenu
run_rofi() {
  (echo -e "$bluelight\n$grayscale\n$negative\n$disable\n$back" | rofi -dmenu -p "Choose the shader") || run_cmd
}

# Execute Command
run_cmd() {
  if [[ $1 == '--bluelight' ]]; then
    hyprshade toggle blue-light-filter
  elif [[ $1 == '--grayscale' ]]; then
    hyprshade toggle grayscale
  elif [[ $1 == '--negative' ]]; then
    hyprshade toggle negative
  elif [[ $1 == '--disable' ]]; then
    hyprshade off
  else
    $HOME/.scripts/menu/menu.sh
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
    $negative)
    run_cmd --negative 
        ;;
    $back)
    run_cmd
        ;;
esac
