swaync-client -d

DND=`swaync-client -D`
  
if [[ "$DND" == "false" ]]; then
  hyprctl notify 1 5000 0 "fontsize:16 Notifications enabled"
else 
  hyprctl notify 1 5000 "rgb(00ffff)" "fontsize:16 Notifications disabled"
fi
