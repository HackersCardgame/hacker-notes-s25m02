#! /bin/bash


pavucontrol &

sleep 2

wmctrl -r "PulseAudio Volume Control" -e 100,100,900,900

