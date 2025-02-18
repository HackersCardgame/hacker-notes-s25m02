#!/bin/bash

ffmpeg -i $1 -c:v libsvtav1 -preset 8 -crf 30 -c:a libopus -b:a 32k -vbr on $1.small..mp4

