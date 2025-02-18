#! /bin/bash

ip link show $1
ip link set $1 down
ip link set $1 address $2
ip link set $1 up

