#!/bin/bash

COUNTER=0

for i in $(ls *.jpg)
do
	if (( $COUNTER % 2 ))
	then
		echo 0 $i
		convert $i -rotate 90 $i
	else
		echo 1 $i
		convert $i -rotate -90 $i
	fi
	#convert $i -rotate -90 $i
	#convert $i -rotate -90 $i

let COUNTER++
done


