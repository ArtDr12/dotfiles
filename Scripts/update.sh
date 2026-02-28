neofetch --ascii_colors 14 14 --colors 14 6 6 6 6 15

echo -e "Launching system update...\n"
sudo -v 
yay --color always --noconfirm || sudo pacman -Su --color always --noconfirm
echo
flatpak update -y

hyprctl notify 1 5000 0 "fontsize:16 System update complete"

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
