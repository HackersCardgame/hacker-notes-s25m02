#!/bin/bash

echo not yet tested

echo Press anykey

read -n 1 -s -r

echo ...

find . -type l -exec ln -srf {} . \;
