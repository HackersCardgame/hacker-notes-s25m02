#!/bin/bash
   
   sudo apt-get update && sudo apt-get upgrade
   sudo apt-get install gedit gnome-terminal git
   ssh-keygen -t ed25519 
   cat ~/.ssh/id_ed25519.pub 
   echo "$(ipconfig.exe  |grep 192 |head -n1|cut -d: -f2 |cut -c 2-|tr -d '\r')"":0"
   echo $DISPLAY
   cat mountUSB.sh 
   sudo apt-get install python-pip
   sudo pip install youtube-dl
   sudo apt-get install ffmpeg
