#!/bin/zsh

# zsh profile file. Runs on login. Environmental variables are set here.

# General
export DEFAULT_USER="jan"

# Adds scripts folder to $PATH
export SCRIPTS="$HOME/scripts"
export PATH="$PATH:$(du "$SCRIPTS" | cut -f2 | paste -sd ':')"

# Default programs:
export EDITOR="nvim"
export TERMINAL="termite"
export BROWSER="firefox-developer-edition"
export READER="zathura"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

#export XAUTHORITY="$XDG_CONFIG_HOME/Xauthority" # Breaks some display managers
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZPLUGINS="/usr/share/zsh/plugins"
export CARGO_HOME="$XDG_DATA_HOME/cargo"

export QT_QPA_PLATFORMTHEME="gtk2"	# Have QT use gtk2 theme
export MOZ_USE_XINPUT2="1"		# Mozilla smooth scrolling/touchpads

# Start graphical server on tty1 if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! ps -e | grep -qw Xorg && exec startx

