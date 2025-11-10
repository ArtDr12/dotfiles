#!/usr/bin/env bash

# Current Theme
theme="$HOME/.config/rofi/config.rasi"

# Options
black='Black'
dark_blue='Dark Blue'
blue='Blue'
cyan='Cyan'
gray='Gray'
back='Back'

# Pass variables to rofi dmenu
run_rofi() {
   echo -e "$black\n$dark_blue\n$blue\n$cyan\n$gray\n$back" | rofi -dmenu -theme ${theme} -p "Choose the background" || run_cmd --back
}

# Execute Command
run_cmd() {
  if [[ $1 == '--black' ]]; then
    swww clear 000000
  elif [[ $1 == '--darkblue' ]]; then
    swww clear 000020
  elif [[ $1 == '--blue' ]]; then
    swww clear 000050
  elif [[ $1 == '--cyan' ]]; then
    swww clear 005984
  elif [[ $1 == '--gray' ]]; then
    swww clear 303030
  else
    $HOME/Scripts/menu/wallpaper.sh
  fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $black)
		run_cmd --black
        ;;
    $dark_blue)
    run_cmd --darkblue
        ;;
    $blue)
    run_cmd --blue 
        ;;
    $cyan)
    run_cmd --cyan 
        ;;
    $gray)
    run_cmd --gray 
        ;;
    *)
    run_cmd --back
        ;;
esac
