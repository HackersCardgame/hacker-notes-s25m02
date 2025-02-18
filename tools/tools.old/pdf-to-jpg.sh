#!/bin/bash

COUNTER=0

for i in $(ls)
do

       echo $i $COUNTER
       pdftoppm -jpeg -r 300 $i mc-$COUNTER-
       let COUNTER++
 done

