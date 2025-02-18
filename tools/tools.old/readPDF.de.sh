#!/bin/bash

t=$(pdftotext $1 -|tr '\n' ' ')

#echo $t

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
	  sleep 1
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
  speak-ng -v de -s 399 "$sentence"

  wait $!
  #sleep 1
  first_interrupt=false
  
done
