neofetch --ascii_colors 14 14 --colors 14 6 6 6 6 15

echo -e "Launching system update...\n"
sudo -v 
yay --color always || sudo pacman -Su --color always
echo
flatpak update

if [[ $(hyprctl activewindow | grep "title:" | sed -e 's/^[ \t]*//') != "title: update.sh" ]]; then notify-send -i software-update-available -u low "System update complete"; fi

echo
read -p "Do you want to clear cache? (y/N) " yn
case $yn in
    [yY]|[yY][eE][sS] )
        echo -e "Clearing cache..."
        rm -rf $HOME/.cache/*
        sudo rm -rf /var/cache/pacman/pkg/*
        break
        ;;
esac

echo -e "\nDone"
sleep 1
