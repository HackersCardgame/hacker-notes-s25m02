IFS=$'\n' && for i in $(cat $1); do espeak-ng -v german -s 350 $i; done
