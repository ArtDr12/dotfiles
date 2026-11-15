[[ $- != *i* ]] && return

case ":${PATH}:" in *:"$HOME/.local/bin":*) ;; *) export PATH="$HOME/.local/bin:$PATH" ;; esac

export HISTFILESIZE=10000
export HISTSIZE=10000

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias py="python3"
alias clear="clear && fastfetch"
=() { calc "$@"; }

fastfetch
eval "$(starship init bash)"
