#!/bin/bash

IFS=$'\n' && for i in $(lynx -dump $1 |grep -B 1000 "Posts navi"); do espeak-ng -v german -s 350 $i ; done

#IFS=$'\n' && for i in $(lynx -dump https://marclandolt.ch/ml_buzzernet/2022/12/30/katherine-horton-dr-der-physik-am-cern-und-schwurbler/ |grep -B 1000 "Posts navi"); do espeak-ng -v german -s 350 $i ; done
