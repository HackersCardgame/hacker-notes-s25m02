#!/bin/bash

t=$(lynx -dump -nolist $1|tr '\n' ' ')

#echo $t

IFS='.?!'
read -ra sentences <<< "$t"

echo $sentences

for sentence in "${sentences[@]}"
 do
	echo "$sentence".
	echo

	#speak-ng -v de -s 399 "$sentence"
	echo "$sentence" |espeak-ng -v de -s 399

	#sleep 1
	
done
