#!/bin/bash

losetup -fP $1
losetup -l

echo fdisk -l /dev/loopX
