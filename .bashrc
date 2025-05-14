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

. "$HOME/.cargo/env"

neofetch --ascii_colors 14 14 --colors 14 6 6 6 6 15

eval "$(starship init bash)"
