TOUCHPAD=`echo $(hyprctl getoption input:touchpad:disable_while_typing | grep int) | tail -c 2`

if [[ "$TOUCHPAD" -eq 0 ]]; then
  hyprctl keyword input:touchpad:disable_while_typing true
  hyprctl notify 5 5000 0 "fontsize:16 Disabled touchpad while typing" 
else
  hyprctl keyword input:touchpad:disable_while_typing false
  hyprctl notify 5 5000 "rgb(00ff00)" "fontsize:16 Enabled touchpad while typing" 
fi
