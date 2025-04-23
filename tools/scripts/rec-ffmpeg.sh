#!/bin/bash

dir=$(date +%y%m%d%H%M%s)

red="\e[91m"
green="\e[92m"
iBlue="\e[44m"
default="\e[39m"
iDefault="\e[49m"



read -n 1 -s -r -p "press any key to create $dir and start record,
to stop press again any key"

mkdir ./$dir
echo $dir >>log.txt

cd $dir
var=0

for i in $(ls /dev/video*)
do
  echo $var
  #ffmpeg -f v4l2 -input_format yuyv422 -framerate 30 -video_size 1280x720 -i $i -preset ultrafast -c:v libx264 cam$var.mjpg &
  #ffmpeg -f v4l2 -input_format yuyv422 -framerate 30 -video_size 1280x720 -i $i -preset ultrafast -c:v mpeg4 cam$var.mjpg &
  #ffmpeg -f v4l2 -input_format yuyv422 -framerate 30 -video_size 1280x720 -i $i -preset ultrafast -c:v libx265 cam$var.mjpg &
  if [ "$i" == "/dev/video0" ]
    then
      continue
      echo continue
  fi
  # ffmpeg -f v4l2 -input_format yuyv422 -framerate 30 -video_size 1280x960 -i $i -preset fast -c:v libx264 cam$var.mjpg &

  ffmpeg -f v4l2 -input_format yuyv422 -framerate 30 -video_size 1280x720 -i $i -preset fast -c:v libx264 cam$var.mjpg &

  # ffmpeg -f v4l2 -input_format yuyv422 -framerate 30 -video_size 1280x720 -i $i -preset fast -c:v libx264 cam$var.mjpg &
  # ffmpeg -f v4l2 -input_format mjpeg -framerate 30 -video_size 1280x720 -i $i -preset fast -c:v libx265 cam$var.mjpg &
  var=$((var+1))
done

arecord -f cd audio.wav &

read -n 1 -s -r -p "Press any KEY to stop"
killall ffmpeg
killall arecord



echo waiting 10 Seconds
sleep 5
echo waiting 5 Seconds
sleep 1
echo waiting 4 Seconds
sleep 1
echo waiting 3 Seconds
sleep 1
echo waiting 2 Seconds
sleep 1
echo waiting 1 Seconds
sleep 1


echo
echo
echo converting ...
echo

nautilus . &
../convert.sh .


