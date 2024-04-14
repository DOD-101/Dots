#
# ~/.bashrc
#

# !!!
# I am mainly using zsh, hence this will be somewhat out of date
# !!!

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [[ "$(tty)" == "/dev/tty1" ]]; then
  fastfetch
  spotify_player -d
fi

export EDITOR="nvim"

alias ll="ls -la"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias stowh="stow -t ~ -S ."
alias stowu="stow -t ~ -D ."

# mkcd

mkcd () {
 mkdir -p "$1" && cd "$1"
}

# allow lf to exit to last dir

lf() {
    cd "$(command lf -print-last-dir "$@")"
}

countdown() {
    start="$(( $(date '+%s') + $1))"
    while [ $start -ge $(date +%s) ]; do
        time="$(( $start - $(date +%s) ))"
        printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"
        sleep 0.1
    done
}

stopwatch() {
    start=$(date +%s)
    while true; do
        time="$(( $(date +%s) - $start))"
        printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"
        sleep 0.1
    done
}
