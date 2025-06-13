#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTFILESIZE=10000
export HISTSIZE=10000

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias py="python3"
alias clear="clear && neofetch --ascii_colors 14 14 --colors 14 6 6 6 6 15"

alias upd='\
    sudo -v && \
    echo -e "\n\033[1;32m==> Starting full system update...\033[0m" && \
    \
    echo -e "\n\033[1;34m[1/5] Updating packages...\033[0m" && \
    yay -Syu --devel --timeupdate --noconfirm && \
    echo
    flatpak update -y && \
    \
    echo -e "\n\033[1;34m[2/5] Removing orphaned packages...\033[0m" && \
    (sudo pacman -Qtdq | sudo pacman -Rns 2> /dev/null) || echo No orphaned pacman packages && \
    flatpak uninstall --unused && \
    \
    echo -e "\n\033[1;34m[3/5] Checking for broken packages...\033[0m" && \
    sudo pacman -Dk && \
    \
    echo -e "\n\033[1;34m[4/5] Rebuilding missing or corrupted files...\033[0m" && \
    sudo pacman -Qqn | sudo pacman -D --asdeps 2> /dev/null | wc -l && \
    sudo pacman -Qq | sudo pacman -D --asexplicit 2> /dev/null | wc -l && \
    flatpak repair && \
    \
    echo -e "\n\033[1;34m[5/5] Cleaning package cache...\033[0m" && \
    yay -Sc --noconfirm && \
    echo -e "\nCache directory: /home/$USER/.cache/" && \
    echo removing cache directory... && \
    rm -rf ~/.cache && \
    \
    echo -e "\n\033[1;32m==> Full update completed!\033[0m"'

. "$HOME/.cargo/env"

neofetch --ascii_colors 14 14 --colors 14 6 6 6 6 15
eval "$(starship init bash)"
