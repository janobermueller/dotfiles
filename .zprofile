#!/bin/zsh

# zsh profile file. Runs on login. Environmental variables are set here.

# General
export DEFAULT_USER="jan"

# Adds scripts folder to $PATH
export SCRIPTS="$HOME/scripts"
export PATH="$PATH:$(du "$SCRIPTS" | cut -f2 | paste -sd ':')"

# Default programs
export BROWSER="firefox"
export VISUAL="nvim"
export EDITOR="$VISUAL"
export FILE="nnn"
export READER="zathura"
export TERMINAL="foot"

# Set default directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_CURRENT_DESKTOP="sway"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZPLUGINS="/usr/share/zsh/plugins"
export ABBR_USER_ABBREVIATIONS_FILE="$XDG_CACHE_HOME/zsh-abbr/user-abbreviations"
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=$XDG_CACHE_HOME/zsh/history
[ ! -s "$HISTFILE" ] && touch "$HISTFILE"

# Other programs
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export MOZ_USE_XINPUT2="1"
export MOZ_ENABLE_WAYLAND=1
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NVM_DIR="$XDG_CONFIG_HOME/nvm"
export SFEED_PLUMBER="lynx"
export SFEED_PLUMBER_INTERACTIVE=1
export SFEED_URL_FILE="$XDG_DATA_HOME/sfeed/history"

# Enable colors in less
export LESS=-R
export LESSHISTFILE="-"
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# Configure bemenu
export BEMENU_OPTS="
	--ignorecase \
	--list '16' \
	--prompt '' \
	--wrap \
	--fixed-height \
	--center \
	--border '2' \
	--bdr '#a89984' \
	--line-height '26' \
	--ch '18' \
	--cw '2' \
	--width-factor '0.4' \
	--fn 'Inter 14' \
	--fb '#1d2021' \
	--ff '#ebdbb2' \
	--nb '#1d2021' \
	--nf '#ebdbb2' \
	--hb '#a89984' \
	--hf '#1d2021' \
	--ab '#1d2021' \
	--af '#ebdbb2'
"

startw() {
	ssh-agent dwl -s "
		swaybg -i ~/.config/wallpaper.jpg &
		/bin/sh -c $SCRIPTS/dwl-status.sh &
		somebar
	"
}

# Start graphical server on tty1 if not already running.
[ "$(tty)" = "/dev/tty1" ] && [ ! $XDG_SESSION_TYPE = "wayland" ] && startw || echo > /dev/null

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
