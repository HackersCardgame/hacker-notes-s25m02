#!/bin/bash
for disk in /dev/sd*; do udisksctl mount -b "$disk" || echo "Failed to mount $disk"; done
echo 
echo
echo========================
echo mounted:
echo -----------------------
ls /media/marc
