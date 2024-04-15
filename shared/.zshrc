# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/david/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


# Oh my zsh

# see https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#agnoster
ZSH_THEME="agnoster-custom" # (this is one of the fancy ones)

ENABLE_CORRECTION="true"
CASE_SENSITIVE="true"

plugins=(git)

source ~/.oh-my-zsh/oh-my-zsh.sh

# -- end -- 


eval "$(atuin init zsh)"
eval "$(dircolors ~/.dircolors)"

if [[ "$(tty)" == "/dev/tty1" ]]; then
  fastfetch
  spotify_player -d
fi
export XCURSOR_THEME=Catppuccin-Macchiato-Dark
export XCURSOR_PATH=${XCURSOR_PATH}:~/.local/share/icons
export EDITOR="nvim"
export SDL_VIDEODRIVER=wayland

alias ll="ls -la"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias code="code . & disown"
alias tzuc="timedatectl set-timezone \$(tzupdate -p)" # TimeZoneUpdateComplete

alias stowh="stow -t ~ -S ."
alias stowu="stow -t ~ -D ."

# mkcd

mkcd () {
    mkdir -p "$1" && cd "$1"
}

# Hyprlaunch

Hyprsingle () {
    Hyprland -c ~/.config/hypr/hyprsingle.conf 
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
