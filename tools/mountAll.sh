#!/bin/bash
for disk in /dev/sd*; do udisksctl mount -b "$disk" || echo "Failed to mount $disk"; done

ls /media/marc
