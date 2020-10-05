#!/bin/sh
# Confirmation prompt for dmenu
# $1 label to be displayed
# $2 command to be performed
# `./promt.sh "Do you want to shutdown?" "shutdown -h now"

[ $(echo -e "Yes\nNo" | dmenu -i -p "$1") \== "Yes" ] && $2
