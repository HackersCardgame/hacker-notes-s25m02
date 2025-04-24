#!/bin/bash

echo "1: x$1x"


if ["$1" = ""]
then
    echo "
    useage:
      ./convert.sh <directory>

    example:
      ./convert.sh 19112504501574653840
"
else
  for i in $(find $1)
    do
      ffmpeg -f rawvideo -pix_fmt yuyv422 -s:v 1280x720 -r 30 -i $i -c:v libx264 -preset slow -crf 18  $i.mp4
    done
fi

