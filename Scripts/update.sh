neofetch --ascii_colors 14 14 --colors 14 6 6 6 6 15
echo -e "░█▀▀░█░█░█▀▀░▀█▀░█▀▀░█▄█░░░█░█░█▀█░█▀▄░█▀█░▀█▀░█▀▀\n░▀▀█░░█░░▀▀█░░█░░█▀▀░█░█░░░█░█░█▀▀░█░█░█▀█░░█░░█▀▀\n░▀▀▀░░▀░░▀▀▀░░▀░░▀▀▀░▀░▀░░░▀▀▀░▀░░░▀▀░░▀░▀░░▀░░▀▀▀\n"
sudo -v 
sudo pacman -Syu 
echo
flatpak update
if [[ $(hyprctl activewindow | grep "title:" | sed -e 's/^[ \t]*//') != "title: update.sh" ]]; then notify-send -i software-update-available "System update complete"; fi
sleep 2
