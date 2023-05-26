#!/bin/bash

if [ "$1" == -h ]
then
echo "=========salt-minion========="
echo "STATUS"
echo "00 command on minion"
echo "01 restart  minion service "
echo "=========salt-manager========"
echo "ADD"
echo "02 salt-key -L (show pending to be accepted)"
echo "03 salt-key -a hostname (accept by hostname)"
echo "STATUS"
echo "04 salt 'hostname' test.ping"
echo "DEL"
echo "05 delete minion"
echo "========TARGET-TYPE==========="
echo "linux"
echo "win"
fi

if [ "$1" == -a ]
then
	echo "============================="
	echo "MODE RUN"
	echo "============================="
	echo "action ?"
	read -r action
	echo "type ?"
	read -r type
	echo "TARGET"
	read -r target
	#todo
	if [ "$action" == '01' ]
	then
		echo "restarting"
		sudo salt '$target' cmd.run 'service salt-minion restart"'
	elif [ "$action" == '02' ]
	then
		echo "list target"
 		salt-key -L
	elif [ "$action" == '03' ]
	then
		echo "add target"
		sudo salt-key -a
	elif [ "$action" == '04' ]
	then
		echo "testing connection with target"
	 	sudo salt "$target" test.ping
	else [ "$action" == '05' ]
		echo "remove target"
		sudo salt-key -d "$target"
	fi
fi
