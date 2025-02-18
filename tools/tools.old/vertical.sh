#!/bin/bash

letters=$(echo $1 | sed -e 's/\(.\)/\1\n/g')


for i in $letters
do
	./blockFont.sh $i
done
