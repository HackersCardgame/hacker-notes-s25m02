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

apt-get purge *edu*

echo "rmmod iwlmvm iwlwifi"


echo -e -n "${red} $(cat /etc/network/interfaces) ${default}"

echo AnyKEY
read

ip addr

#ip addr add 192.168.123.214/24 dev interface

#ip link set interface up

#ip route add default via 192.168.123.1

echo "
 _          _          _  __ _ 
(_)_      _| |_      _(_)/ _(_)
| \ \ /\ / / \ \ /\ / / | |_| |
| |\ V  V /| |\ V  V /| |  _| |
|_| \_/\_/ |_| \_/\_/ |_|_| |_|
      entfernen !!!! blacklist.sh
"

echo "
 ____   ______  __  ____  _           
/ ___| / ___\ \/ / | __ )(_) ___  ___ 
\___ \| |  _ \  /  |  _ \| |/ _ \/ __|
 ___) | |_| |/  \  | |_) | | (_) \__ \
|____/ \____/_/\_\ |____/|_|\___/|___/
                                      

"

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


echo AnyKEY
read

apt-get update -y
apt-get upgrade -y
apt-get install -y vim
apt-get install -y git
apt-get install -y easyeffects
apt-get install -y screen
#apt-get install -y gdm3
#apt-get install -y xfwm4 
apt-get install -y gnome

apt-get install -y mpg123
apt-get install -y alsa-utils

apt-get install -y locate
apt-get install -y plocate
apt-get install -y alsa-utils
#apt-get install -y python3-mido python3-rtmidi python3-pulsectl
#apt-get install -y gnome-shell
#apt-get install -y gnome-backgrounds


apt-get install -y wmctrl
apt-get install -y xdotool


if YESNO "drucker löschen?"
then
  apt-get purge -y cups*
  apt-get purge libcupsfilters2*
  apt-get install -y cups
  apt-get install cups-client -y
fi

apt-get install -y gedit
apt-get install -y gnome-terminal
apt-get install -y mdadm
apt-get install -y smarttools
apt-get install -y jigdo-file
apt-get install -y wodim
apt-get install -y gimp

apt-get purge firefox-esr
apt-get install -y epiphany-browser


apt-get install -y qemu-system 
apt-get install -y qemu-kvm
apt-get install -y libvirt-daemon
apt-get install -y bridge-utils
apt-get install -y virt-manager 

echo apt cpu-checker

apt-get install -y figlet
apt-get install -y inkscape 
apt-get install -y mixxx 
apt-get install -y ffmpeg
apt-get install -y kdenlive
apt-get install -y obs-studio
apt-get install -y tesseract-ocr
apt-get install tesseract-ocr-eng -y
apt-get install tesseract-ocr-deu -y

#apt-get install -y nvidia-detect

updatedb
updatedb --localpaths=/media

apt-get install -y apt-file
apt-file update

apt-get install -y espeak
apt-get install -y espeak-ng
apt-get install -y jackd2 
apt-get install -y qjackctl
apt-get install -y zita-ajbridge 
apt-get install -y pulseaudio-module-jack 
apt-get install -y pavumeter
apt-get install -y pavucontrol
apt-get install -y pulseaudio

apt-get install -y iotop
apt-get install -y xxd

apt-get install -y libreoffice
apt-get install -y calibre

apt-get install -y nautilus
apt-get install -y eog

apt-get install -y rdfind
apt-get install -y rsync

apt-get install -y asunder
apt-get install -y brasero

apt-get install -y xdotool
apt-get install -y wmctrl


#apt-get install cups-client -y
apt-get install tesseract-ocr-eng tesseract-ocr-deu -y


if YESNO "wine, wine64 und wine32:i386 installieren ???"
then

apt-get install -y wine
apt-get install -y wine64
apt-get install -y winetricks

echo dann \"winetricks d3dx9\" und \"winetricks vcrun2010\" eingeben mit dem Benutzer

dpkg --add-architecture i386
apt-get update
apt-get install wine32:i386

fi

apt-get install -y xdotool wmctrl

apt-get install jigdo
apt-get install jigdo-lite
apt-get install jigdo-file

apt-get install cups-client -y

echo "printer installieren"
echo ""
echo "printer installieren"
echo ""
echo "printer installieren"
echo ""
echo "printer installieren"
echo ""
echo "printer installieren"

#nvidia-detect

# edit repository list
#==============================================================================
if YESNO "install nvidia-tesla-470-driver ???"
then
apt-get install linux-headers-amd64
apt-get install nvidia-tesla-470-driver
fi

echo apt kvm-ok


# edit repository list
#==============================================================================
if YESNO "libvirtd starten und installieren?"
then
  systemctl start libvirtd
#  systemctl enable libvirtd
#  dann virt-manager starten
fi

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


#apt-get install mbrola mbrola-de* mbrola-us* mbrola-en1
apt-get install espeak espeak-ng

cp /usr/share/xsessions/*xorg* /usr/share/xsessions/TEST.desktop



echo brctrl show
brctl addbr virbr1
ip link set virbr1 up

journalctl -xe |grep network -i



/usr/sbin/update-initramfs -u

systemctl disable gnome-remote-desktop
#apt-get install lightdm orchis-gtk-theme materia-gtk-theme


echo -e "${red}printer installieren"
echo ""
echo -e "${red2}printer installieren"
echo ""
echo -e "printer installieren"
echo ""
echo -e "${red}printer installieren"
echo ""
echo -e "${red2}printer installieren"
echo ""
