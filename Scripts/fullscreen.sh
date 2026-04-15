FULL=1896

WORKSPACE=$(hyprctl activeworkspace -j | jq -r '.name')
WINDOWS=$(hyprctl clients -j | jq -r ".[] | select(.workspace.name==\"$WORKSPACE\") | .address")

if [[ `hyprctl activewindow -j | jq ".size[0]"` != "$FULL" ]]; then
  hyprctl dispatch layoutmsg colresize 1
else
  for window in $WINDOWS; do
    address = ${window#0x}
    hyprctl dispatch layoutmsg colresize 0.5 address:$address
  done
fi
