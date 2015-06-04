#!/bin/bash

# Helper script
# Sends one or more commands to the printrbot via API

# Source variables
. /home/pi/.cerealbox/config

# Set logfile
LOG=/tmp/printr_cmd.sh

cmds=""

for cmd in "$@"
	do
	$CB_DIR/write_msg.sh "STD,LOG" "[$cmd]" "$LOG"
	if [ "$cmd" = "$1" ]; then
		cmds="\"${cmd}\""
	else
		cmds="${cmds},\"${cmd}\""
	fi
done

$CB_DIR/write_msg.sh "STD,LOG" "Sending printer commands: $cmds" "$LOG"
resty 'http://localhost/api'
POST /printer/command "{\"commands\":[$cmds]}"
