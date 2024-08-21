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

plugins=(git rust)

source ~/.oh-my-zsh/oh-my-zsh.sh

export VIRTUAL_ENV_DISABLE_PROMPT="true"

# -- end -- 

setopt globdots
setopt extended_glob

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

eval "$(atuin init zsh)"
eval "$(dircolors ~/.dircolors)"

if [[ "$(tty)" == "/dev/tty1" ]]; then
  fastfetch
fi

export XCURSOR_THEME=Catppuccin-Macchiato-Dark
export XCURSOR_PATH=${XCURSOR_PATH}:~/.local/share/icons
export NVIM_APPNAME=nvim/janc
export TERM="foot"
export EDITOR="nvim"
export SDL_VIDEODRIVER=wayland

export PATH=$PATH:~/.bin/ 
export XDG_DATA_DIRS=/home/david/.local/share/applications/:$XDG_DATA_DIRS
export GTRASH_HOME_TRASH_DIR="$HOME/.local/share/Trash"
export GTRASH_ONLY_HOME_TRASH="true"

alias rt="gtrash put"
alias l="ls -vAlh --group-directories-first"
alias cf='T="$(find . -type f | fzf)" ; if [[ -f "$T" ]] ; then T="$(dirname "$T")" ; fi ; cd "$T"'

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias remove-orphans='sudo pacman -Rns $(pacman -Qtdq | grep -v "debug")'

alias tzuc="timedatectl set-timezone \$(tzupdate -p)" # TimeZoneUpdateComplete
alias sp="spotify_player"

alias pyserver="python -m http.server"
alias pyvenv="python -m venv .venv"

alias stowh="stow -t ~ -S ."
alias stowu="stow -t ~ -D ."

alias n="nvim"
alias g="git"

# yazi

yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# mkcd

mkcd () {
    mkdir -p "$1" && cd "$1"
}

# Hyprlaunch

Hyprsingle () {
    Hyprland -c ~/.config/hypr/hyprsingle.conf 
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

eval "$(zoxide init zsh)"
