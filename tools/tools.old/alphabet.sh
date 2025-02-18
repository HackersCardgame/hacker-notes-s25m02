#!/bin/bash

letters=$(echo ABCDEFG | sed -e 's/\(.\)/\1\n/g')


for i in $letters
do
	echo -n $i = "{{"
	./arrayFont.sh $i
	echo "};"
done
