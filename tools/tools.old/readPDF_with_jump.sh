#!/bin/bash

t=$(pdftotext $1 -|tr '\n' ' ')

#echo $t

mark=0
cont=0
count=0

echo F:  $count

handle_sigint() {
  if [ "$count" -gt 3 ]
  then
    exit 1
  else
    echo "killing espeak  ...."
	  first_interrupt=true
	  killall espeak
	  let count=count+1
	  sleep 0.2
  fi
}

trap 'handle_sigint' SIGINT



IFS='.?!'
read -ra sentences <<< "$t"

echo $sentences

for sentence in "${sentences[@]}"
 do
  echo "$sentence".
  echo
  count=0
  #if [[ "$sentence" == *"assistant secretary of state Philip Gordon"* ]];
  #if [[ "$sentence" == *"meeting with a US congressional delegation, for example, links them "* ]];
 # if [[ "$sentence" == *"and the 1949 Geneva Convention"* ]];
  if [[ "$sentence" == *"a"* ]];
  then
    mark=1
  fi
  if [ "$mark" == "1"  ]
  then
    echo TEXT:
    #speak-ng -v en -s 399 "$sentence" --stdout |aplay
    aplay <(espeak-ng -v en -s 399 "$sentence" --stdout)
    echo ================


    #wait $!
    #sleep 1
    first_interrupt=false
  fi
  
done


  #if [[ "$sentence" == *"the reigning world-view was that liberal"* ]];
