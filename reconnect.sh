#!/bin/bash
help() {
	cat <<EOF

SSH Reconnect (Michael Munger <mj@hph.io>)

  Continually ping a host until it's up, then attempt to connect via SSH.

Usage: reconnect.sh [host]

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