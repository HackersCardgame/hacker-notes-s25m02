#!/bin/bash

for i in $(ls *.JPG)
do
	out=$(basename $i .JPG).small.jpg
	echo $out
	ffmpeg -i $i -vf scale=1600:-1 -qscale:v 2 $out 
done


