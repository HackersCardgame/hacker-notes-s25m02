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

echo ip addr add 192.168.123.214/24 dev interface

echo ip link set interface up

	echo ip route add default via 192.168.123.1

echo apt-get install resolvconf
echo apt-get install systemd-resolved
echo apt-get install network-manager
vim /etc/resolv.conf
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

read

echo apt-get install -y git vim sudo gnome-boxes figlet inkscape gedit mixxx 
echo apt-get install -y qemu-system qemu-kvm libvirt-daemon bridge-utils virt-manager 
echo apt cpu-checker


echo sudo wodim -v -data dev=/dev/sr0  ...iso
echo sha512 ...iso
echo "dd if=/dev/sr0 bs=2048 | sha512"







if YESNO "add bridge"
then
echo "  
allow-hotplug virbr1
iface virbr1 inet static
  address 10.20.31.32
  netmask 255.255.255.0
  " >> /etc/network/interfaces

fi

if YESNO "user zur libvirt gruppe hunzufügen?"
then
  usermod -aG libvirt marc
fi
red="\e[91m"
red2="\e[95m"
default="\e[39m"


echo brctrl show
echo brctl addbr virbr1
echo ip link set virbr1 up

echo journalctl -xe |grep network -i

rmmod iwlmvm iwlwifi

brctl show && brctl addbr virbr1 && brctl show && ip link set virbr1 up && brctl show && ip addr
