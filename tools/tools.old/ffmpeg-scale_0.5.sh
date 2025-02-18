#!/bin/bash

ffmpeg -i "$1" -vf "scale=iw/2:ih/2" "$1".small.mp4
