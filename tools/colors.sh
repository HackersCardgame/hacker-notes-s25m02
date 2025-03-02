#!/bin/bash

echo "
Grundfarben:

    Schwarz: \033[0;30m
    Rot: \033[0;31m
    Grün: \033[0;32m
    Gelb: \033[0;33m
    Blau: \033[0;34m
    Magenta: \033[0;35m
    Cyan: \033[0;36m
    Weiß: \033[0;37m

Weitere Varianten (Fette Farben):

    Fettes Schwarz: \033[1;30m
    Fettes Rot: \033[1;31m
    Fettes Grün: \033[1;32m
    Fettes Gelb: \033[1;33m
    Fettes Blau: \033[1;34m
    Fettes Magenta: \033[1;35m
    Fettes Cyan: \033[1;36m
    Fettes Weiß: \033[1;37m

Helle Farben (intensivere Varianten):

    Helles Schwarz (Grau): \033[0;90m
    Helles Rot: \033[0;91m
    Helles Grün: \033[0;92m
    Helles Gelb: \033[0;93m
    Helles Blau: \033[0;94m
    Helles Magenta: \033[0;95m
    Helles Cyan: \033[0;96m
    Helles Weiß: \033[0;97m

Fette Helle Farben:

    Fettes Helles Schwarz (Grau): \033[1;90m
    Fettes Helles Rot: \033[1;91m
    Fettes Helles Grün: \033[1;92m
    Fettes Helles Gelb: \033[1;93m
    Fettes Helles Blau: \033[1;94m
    Fettes Helles Magenta: \033[1;95m
    Fettes Helles Cyan: \033[1;96m
    Fettes Helles Weiß: \033[1;97m


    
    Reset: \033[0m "

for i in $(echo 0 1 2 3 4 5 6 7)
do
  for j in $(echo 3 9)
  do    
    for k in $(echo "\033[0;${j}${i}m \033[1;${j}${i}m" )
    do
      echo -e $k ---
      echo $k
    done
  done
done
