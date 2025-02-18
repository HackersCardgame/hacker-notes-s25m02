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



udisksctl mount -b /dev/sdb?
udisksctl mount -b /dev/sdc?
udisksctl mount -b /dev/sdd?
udisksctl mount -b /dev/sde?

