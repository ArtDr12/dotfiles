COLOR=`hyprpicker -al`

if [[ -z "$COLOR" ]]; then
  hyprctl notify 3 5000 0 "fontsize:16 Failed to copy color"
else 
  hyprctl notify -1 5000 "rgb(${COLOR:1})" "fontsize:16 Copied color to clipboard: $COLOR"
fi
