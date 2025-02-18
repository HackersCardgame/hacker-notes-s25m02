#!/bin/bash
IFS=$'\n'
for i in $(ls /mnt/d/Music.noDupes/Compilations)
do
    [ -z "`find $i -type f`" ] && rmdir /mnt/d/Music.noDupes/Compilations/"$i"
done

