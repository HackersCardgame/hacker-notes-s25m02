#!/bin/bash
#

nmap -sP 192.168.1.0/26

COUNT=0

for in in $(seq 1000000)
do
	ping -c1 192.168.1.254
	ping -c1 192.168.1.1
	ping 8.8.8.8
	COUNT=$COUNT.
	echo $COUNT
	sleep 1
done

	
