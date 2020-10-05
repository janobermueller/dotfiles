#!/bin/sh

source "$SCRIPTS/dmenu-base.sh"

declare -a ACTIONS
ACTIONS[0]="\ue971 Firefox"
ACTIONS[1]="\ue9dd Terminal"
ACTIONS[2]="\ue960 Vim"
ACTIONS[3]="\uf162 Update"
ACTIONS[4]="\ue9b5 Power"

ACTION="$(
	for ACTION in "${ACTIONS[@]}"; do
		echo -e $ACTION
	done | dmenu -p 'Launch:'
)"

case "$ACTION" in
	*Firefox*)
		firefox-developer-edition
		;;
	*Terminal)
		st
		;;
	*Vim)
		st --command vim
		;;
	*Power)

		"$SCRIPTS/dmenu-power.sh"
		;;
	*)
		$ACTION
		;;
esac
