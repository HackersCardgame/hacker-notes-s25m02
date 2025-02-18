#!/bin/bash

t=$(cat $1|tr '\n' ' ')

#echo $t
red="\e[91m"
yellow="\e[0;33m"
green="\e[0;32m"
default="\e[39m"


IFS='.?!'
read -ra sentences <<< "$t"

echo $sentences

for sentence in "${sentences[@]}"
 do
	echo -e ">>>"  "$sentence".
	echo

	speak-ng -v de -s 399 $(echo "$sentence"| sed -r 's/\/x1B\[[0-9;]*[mk]//g')

	#sleep 1
	
done
