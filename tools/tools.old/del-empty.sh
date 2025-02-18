#!/bin/bash
IFS=$'\n'
for i in $(ls /mnt/d/Music.noDupes/Compilations)
do
    [ -z "`find $i -type f`" ] && rmdir "/mnt/d/Music.noDupes/$i"
done


#kind besser als eltern in etwas, dann stellt man jemanden an der dem kind etwas sabotiert damit mami dann helfen kann (mit der lösung vom saboteur schon vorbereitet)

#also windows ist wirst case voralem für Bitching gedacht...


