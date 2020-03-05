#!/bin/bash

case $1 in
	tty)
	tail -f /var/log/auth.log | grep "FAILED LOGIN"
	;;
	ssh)
	tail -f /var/log/auth.log | grep "Failed password"
	;;
	terminal)
	tail -f /var/log/auth.log | grep "FAILED su"
	;;
 	*|-help|--help)
	cat << EOF
	If you want to check for failed authentications then type 
$0 tty        ---- for terminal ctrl+alt+f3
$0 ssh        ---- for ssh connection
$0 terminal   ---- for terminal connection
EOF
;;
esac
