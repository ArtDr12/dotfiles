neofetch --ascii_colors 14 14 --colors 14 6 6 6 6 15
echo -e "Launching system update...\n"
sudo -v 
yay -Syu 
echo
flatpak update
echo -e "\nDone"
if [[ $(hyprctl activewindow | grep "title:" | sed -e 's/^[ \t]*//') != "title: update.sh" ]]; then notify-send -i software-update-available -u low "System update complete"; fi
sleep 1
