#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTFILESIZE=10000
export HISTSIZE=10000

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias upd='\
    sudo -v && \
    echo -e "\n\033[1;32m==> Starting full system update...\033[0m" && \
    echo -e "\n\033[1;34m[1/7] Updating pacman databases...\033[0m" && \
    sudo pacman -Syy && \
    \
    echo -e "\n\033[1;34m[2/7] Updating system packages with yay...\033[0m" && \
    yay -Syu --devel --timeupdate && \
    \
    echo -e "\n\033[1;34m[3/7] Updating flatpak packages...\033[0m" && \
    flatpak update -y && \
    \
    echo -e "\n\033[1;34m[4/7] Removing orphaned packages...\033[0m" && \
    sudo pacman -Qtdq | sudo pacman -Rns - && \
    \
    echo -e "\n\033[1;34m[5/7] Cleaning package cache...\033[0m" && \
    yay -Sc --noconfirm && \
    \
    echo -e "\n\033[1;34m[6/7] Checking for broken packages...\033[0m" && \
    sudo pacman -Dk && \
    \
    echo -e "\n\033[1;34m[7/7] Rebuilding missing or corrupted files...\033[0m" && \
    sudo pacman -Qqn | sudo pacman -D --asdeps - && \
    sudo pacman -Qq | sudo pacman -D --asexplicit - && \
    \
    echo -e "\n\033[1;32m==> Full update completed!\033[0m"'

alias py="python3"

. "$HOME/.cargo/env"

neofetch --ascii_colors 14 14 --colors 14 6 6 6 6 15

eval "$(starship init bash)"
