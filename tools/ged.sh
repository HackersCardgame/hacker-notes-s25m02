#!/bin/sh
h=$(git rev-parse HEAD)
echo "----=====  $(date) $(pwd) $h ====----"
git add -A ../../..
git commit -m "... $h"


