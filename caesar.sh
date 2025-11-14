#!/bin/bash

usage() {
	echo "usage: caesar.sh [rotation]"
}

if [ "$1" = "-h" ]; then
	usage
	exit 0
fi

if [ $# -gt 1 ]; then
	usage
	exit 1
fi

rot=${1:-13}

rot=$(( rot % 26 ))

if [ $rot -lt 0 ]; then
	rot=$(( rot + 26 ))
fi

upper="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
lower="abcdefghijklmnopqrstuvwxyz"

upper_rot=$(echo "$upper" | cut -c$((rot+1))-26)$(echo "$upper" | cut -c1-$rot)
lower_rot=$(echo "$lower" | cut -c$((rot+1))-26)$(echo "$lower" | cut -c1-$rot)

tr "$upper$lower" "$upper_rot$lower_rot"
