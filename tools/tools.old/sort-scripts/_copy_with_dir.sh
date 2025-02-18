#!/bin/bash

#Script Template
#==============================================================================
#title           :
#description     :
#author		 :Marc jr. Landolt, @PinkyDef
#date            :
#version         :0.1
#usage		 :
#notes           :
#bash_version    :
#==============================================================================


echo $1 $2

# Define Editor
#==============================================================================
#EDITOR=$(which nano)
EDITOR=$(which vim)
#==============================================================================


# Color Definitions
#==============================================================================
red="\e[91m"
red2="\e[95m"
default="\e[39m"
#==============================================================================


# Define which Linux Distribution
#==============================================================================
#distro=jessie
distro=stretch
#==============================================================================


# Helper Function to show first the command that is beeing executed
#==============================================================================
function ShowAndExecute {
#show command
echo -e "${red} $1 ${default}"
#execute command
$1
#test if it worked or give an ERROR Message in red, return code of apt is stored in $?
rc=$?; if [[ $rc != 0 ]]; then echo -e ${red}ERROR${default} $rc; fi
}
##test if everything worked
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


# Test if script runs as root otherweise exit with exit code 1
#==============================================================================
if [[ $EUID -ne 0 ]]; then
  echo -e -n "
${red}You must be a root user to run this script${default}
at the moment you are " 2>&1
  id | cut -d " " -f1
  echo
  exit 1
fi
#==============================================================================

echo '$1'=$1


# Test(?) if user has given enough parameters
#==============================================================================
echo -e "Usage:
------
Enter ${red}sudo ${0} sourceDIR targetDIR fileType${default} 
eg.   ${red2}sudo ${0} ./fotos ./sorted/fotos jpg${default} "
echo
echo " arguments ---------------->  ${@}     "
echo " \$1 ----------------------->  $1       "
echo " \$2 ----------------------->  $2       "
echo " \$3 ----------------------->  $3       "
echo " path to script ----------->  ${0}     "
echo " parent path -------------->  ${0%/*}  "
echo " script name -------------->  ${0##*/} "
echo
#==============================================================================

echo -e "${red}${0} ${@}${default}"

echo 

echo -e "${red2}>>> DONT <<<${default} forget the trailing slash, eg. fotos/'"

echo

echo press [ctrl c] to abort
read



echo chmod
echo indexed wenn gleich
echo PROBLEM HackersCardgame13/teamSheeple/tagebuch/myLife/2012/Dezember/ also besser auf jahreszahl
echo diff zur kontrolle

oldDir=$(pwd)

cd $1
echo cd $1


echo 
echo press [ctrl c] to abort
read


find . -type f  -exec "${oldDir}/DN.sh" "${oldDir}/$1" "${oldDir}/$2" "$(echo '{}')"  \; 

echo cd $oldDir
cd $oldDir
