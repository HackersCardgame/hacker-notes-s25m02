#!/bin/bash

  533  aplay -l
  534  arecord -D hw:6 cd asdf.wav
  535  arecord -D hw:6 -f cd asdf.wav
  536  amixer -c hw:6 scontrols
  537  amixer -c 6 scontrols
  538  amixer -c 6 contents

amixer -c 6 set 'PCM Capture Source' 'IEC958 In'
/usr/sbin/alsactl store
