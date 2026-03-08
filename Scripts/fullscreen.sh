FULL=1896
SIZE=`hyprctl activewindow -j | jq ".size[0]"`

if [[ "$SIZE" == "$FULL" ]]; then
  hyprctl dispatch layoutmsg colresize 0.5
  hyprctl dispatch layoutmsg fit tobeg
else
  hyprctl dispatch layoutmsg colresize 1
fi
