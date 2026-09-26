neofetch --ascii_colors 14 14 --colors 14 6 6 6 6 15

echo -e "Launching system update...\n"
sudo -v 
yay --color always --noconfirm || sudo pacman --color always --noconfirm -Syu
echo
flatpak update -y

hyprctl -q notify 1 5000 0 "fontsize:16 System update complete" 

echo
read -p "Do you want to clear orphaned packages? (y/N) " yn
case $yn in
    [yY]|[yY][eE][sS] )
        yay --color always --noconfirm -Rns $(yay -Qdtq) 2>/dev/null
        flatpak uninstall --unused -y
        ;;
esac

echo
read -p "Do you want to clear cache? (y/N) " yn
case $yn in
    [yY]|[yY][eE][sS] )
        echo "Clearing cache..."
        rm -rf $HOME/.cache/*
        sudo rm -rf /var/cache/pacman/pkg/*
        ;;
esac

echo
read -rsn 1 -p "Press any key to exit..."
echo
