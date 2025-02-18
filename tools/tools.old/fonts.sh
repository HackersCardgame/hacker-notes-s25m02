#!/bin/bash

fonts=$(ls /usr/share/figlet/*flf)
echo $fonts
for i in $fonts
do
	figlet -f $(echo $i |cut -d'.' -f1) $1

done
