#!/bin/bash

#Script Template
#==============================================================================
#title           :
#description     :
#author		 :Marc Landolt, Twitter: @PinkyDef / Github: @braindef
#date            :
#version         :0.1
#usage		 :
#notes           :
#bash_version    :
#==============================================================================


# Define Editor
#==============================================================================
#EDITOR=$(which nano)
EDITOR=$(which vim)
#==============================================================================


# Color Definitions
#==============================================================================
red="\e[91m"
yellow="\e[0;33m"
green="\e[0;32m"
default="\e[39m"
#==============================================================================

echo "
#deb cdrom:[Debian GNU/Linux 12.5.0 _Bookworm_ - Official amd64 DVD Binary-1 with firmware 20240210-11:28]/ bookworm contrib main non-free-firmware

deb https://deb.debian.org/debian bookworm main contrib non-free non-free-firmware
deb-src https://deb.debian.org/debian bookworm main contrib non-free non-free-firmware

deb https://deb.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware
deb-src https://deb.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware

deb https://deb.debian.org/debian bookworm-updates main contrib non-free non-free-firmware
deb-src https://deb.debian.org/debian bookworm-updates main contrib non-free non-free-firmware
"

# Helper Function for YES or NO Answers
#------------------------------------------------------------------------------
# Example YESNO "Question to ask" "command to be executed"
#==============================================================================
function YESNO {
echo -e -n "
${red}$1 [y/N]${default} "
read -d'' -s -n1 answer
echo
if  [ "$answer" = "y" ] || [ "$answer" = "Y" ]
then
return 0
else
echo -e "
"
return 1
fi
}
#==============================================================================

echo "rmmod iwlmvm iwlwifi"

rmmod iwlmvm iwlwifi
rmmod iwlmvm 
rmmod iwlwifi
rmmod bluetooth
rmmod btrtl
rmmod btmtk
rmmod btintel
rmmod btbcm
rmmod bnep
rmmod btusb
# rmmod rfcomm

echo lsmod .... iwlwifi
lsmod |grep iwlwifi

echo lsmod .... iwlmvm
lsmod |grep iwlmvm

echo blacklist iwlwifi
echo "blacklist iwlwifi" > /etc/modprobe.d/blacklist-wifi.conf


echo blacklist iwlmvm
echo "blacklist iwlmvm" >> /etc/modprobe.d/blacklist-wifi.conf

echo blacklist bluetooth btusb btintel btrtl btmtk btbmc

echo BLUETHOOTH

echo "blacklist bluetooth" > /etc/modprobe.d/blacklist-bluetooth.conf
echo "blacklist btusb" >> /etc/modprobe.d/blacklist-bluetooth.conf
echo "blacklist btintel" >> /etc/modprobe.d/blacklist-bluetooth.conf
echo "blacklist btrtl" >> /etc/modprobe.d/blacklist-bluetooth.conf
echo "blacklist btmtk" >> /etc/modprobe.d/blacklist-bluetooth.conf
echo "blacklist btbmc" >> /etc/modprobe.d/blacklist-bluetooth.conf
read
echo -e -n "${red} $(cat /etc/network/interfaces) ${default}"

echo AnyKEY
read

echo -e -n "${red} $(ip addr) ${default}"


echo ip addr add 192.168.123.214/24 dev interface

echo ip link set interface up

echo ip route add default via 192.168.123.1

echo apt-get install resolvconf
echo apt-get install systemd-resolved
echo apt-get install network-manager
echo vim /etc/resolv.conf
echo nameserver 192.168.123.1


echo nmcli connection add type ethernet ifname eth1 con-name USB1
echo nmcli connection up USB1

echo ACTIION=="add", SUBSYTEM=="net", SUBSYSTEM=="usb", NAME="usb-eth%n"

echo nmcli connection show
echo nmcli connection modify CONNECTION_NAME ipv4.method auto
echo nmcli connection up CONNECTION_NAME

echo nmcli device status
echo nmcli device set eth1 managed yes

echo nmcli device status

echo systemctl restart NetworkManager

echo udevadm control --reload-rules
echo udevadm trigger

echo UPDATE INIT-RAMFS


echo /sbin/update-initramfs -u


echo AnyKEY
read


#btrtl btmtk btintel btbcm bnep btusb rfcomm
