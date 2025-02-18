#!/bin/bash
IFS=$'\n'

for i in $(cat list.txt)
do
	echo $(dirname $i) $(basename $i)
	mkdir -p "~/hackerscardgame-notes-s21m07/$(dirname $i |cut -c 3-)"
	cp "$(dirname $i |cut -c 3-)/$(basename $i)" "~/hackerscardgame-notes-s21m07/$(dirname $i|cut -c 3-)"
done


