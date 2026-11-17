#!/usr/bin/env bash

fastfetch

echo -e "Launching system update...\n"
sudo -v 

yay --color always --noconfirm || sudo pacman --color always --noconfirm -Syu
echo

if command -v flatpak >/dev/null 2>&1; then
  flatpak update -y
  echo
fi

hyprctl -q notify 1 5000 0 "fontsize:16 System update complete" 

read -p "Do you want to clear orphaned packages? (y/N) " yn
case $yn in
  [yY]|[yY][eE][sS] )
    yay --color always --noconfirm -Rns $(yay -Qdtq) 2>/dev/null
    command -v flatpak >/dev/null 2>&1 && flatpak uninstall --unused -y
    ;;
esac
echo

read -p "Do you want to clear cache? (y/N) " yn
case $yn in
  [yY]|[yY][eE][sS] )
    echo "Clearing cache..."
    rm -rf $HOME/.cache/*
    sudo paccache -r
    yay -Sc --noconfirm

    if command -v flatpak >/dev/null 2>&1; then
      sudo rm -rf /var/tmp/flatpak-cache-*
      rm -rf ~/.var/app/*/cache/*
    fi
    ;;
esac
echo

if command -v flatpak >/dev/null 2>&1; then
  read -p "Do you want to repair flatpak installations? (y/N) " yn
  
  case $yn in 
    [yY]|[yY][eE][sS] )
      echo "Repairing flatpak packages..."
      flatpak repair -y
      echo
    ;;
  esac
fi

read -rsn 1 -p "Press any key to exit..."
