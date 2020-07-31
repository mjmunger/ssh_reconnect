#!/bin/bash
help() {
	cat <<EOF

SSH Reconnect - continuously ping a host until it's up, then connect.

Usage: reconnect.sh [host]

File issues on github: https://github.com/mjmunger/ssh_reconnect

EOF
}

if [ $# -ne 1 ]; then
	help
	exit 1
fi

HOST=$1
echo -n "Waiting to reconnect to ${HOST}..."
until ping -c1 ${HOST} > /dev/null 2>&1; do
	STATUS=$?
	if [ ${STATUS} -eq 2 ];
	then
		printf "Error! Make sure that host exists.\n"
		exit ${STATUS}
	fi
	printf "."
done
printf "\nIt's up!\n"
ssh ${HOST}