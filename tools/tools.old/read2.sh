#!/bin/bash

t=$(cat $1|tr '\n' ' ')

#echo $t

IFS='.?!'
read -ra sentences <<< "$t"

echo $sentences

for sentence in "${sentences[@]}"
 do
	echo "$sentence".
	echo

	speak-ng -v de -s 399 "$sentence"

	#sleep 1
	
done
