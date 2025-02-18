#!/bin/bash

IFS=$'\n' && for i in $(curl $1); do echo $i |sed -e 's/<[^>]*>//g' | espeak-ng -v german -s 350; done

#IFS=$'\n' && for i in $(curl https://raw.githubusercontent.com/HackersCardgame/hackerscardgame-notes-s22m12/main/tagebuch/2022/dezember/noah.txt); do echo $i |sed -e 's/<[^>]*>//g' | espeak-ng -v german -s 350; done

