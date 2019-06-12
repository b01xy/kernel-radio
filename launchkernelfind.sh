#!/bin/bash

######################################################################
# find all files of the os and send 2 minimodem one by one           #
######################################################################
sleep 3

while true
do
	find /data/pnode/algo/linux-stable -type d \( -path /proc -o -path /sys -o -path /tmp \) -prune -o -exec ./espeakernel.sh {} +
done

