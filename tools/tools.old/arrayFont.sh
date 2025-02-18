#!/bin/bash
figlet -f banner $1  -w 200 | sed -e "s/ /0,/g" | sed -e "s/#/1,/g" |tr "\n" X | sed -e "s/X/},X{/g" |tr 'X' '\n'


