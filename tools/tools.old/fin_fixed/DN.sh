#!/bin/bash

echo DN.sh srcFILE targetFILE subDir

subDir="$(echo $3|cut -c3-)"

mkdir -p "$(dirname "${2}$subDir}")"


echo EE if $(ls "$2${subDir}")

if $(ls "$2${subDir}">/dev/null)
then
  if $(diff "$1${subDir}" "$2${subDir}" >/dev/null)
    then
      echo $1${subDir} and $2${subDir} identical
      exit 0
  fi
  for i in $(seq -w 1 100)
  do
    echo if $ diff "$1${subDir}" "$2${subDir}.${i}"
    if $(diff "$1${subDir}" "$2${subDir}.${i}" >/dev/null)
    then
      echo EE $1${subDir} and $2${subDir}.${i} identical
      exit 0
    else
      if $(ls "$2${subDir}.${i}">/dev/null)
      then
        echo next index
        continue
      else
        echo EE new file $2${subDir}.${i}
        cp -i "$1${subDir}" "$2${subDir}.${i}"
        diff "$1${subDir}" "$2${subDir}.${i}"
        exit 0

      fi
    fi
  done
else
  cp -i "$1${subDir}" "$2${subDir}"
  echo new file
fi

