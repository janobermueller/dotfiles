#!/bin/sh

source "$SCRIPTS/dmenu-base.sh"

declare -a ACTIONS
ACTIONS[0]="\uf903 Suspend"
ACTIONS[1]="\uf708 Restart"
ACTIONS[2]="\uf425 Shutdown"

ACTION=$(
	for ACTION in "${ACTIONS[@]}"; do
		echo -e $ACTION
	done | dmenu -p 'Power:'
)


case "$ACTION" in
	*Shutdown)
		shutdown now
		;;
	*Suspend)
		systemctl suspend 2>/dev/null
		;;
	*Logout)
		bspc quit
		;;
	*Restart)
		reboot
		;;
esac
