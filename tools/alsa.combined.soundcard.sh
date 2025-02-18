#!/bin/bash

systemctl --user status pipewire


pactl info |grep "Server Name" --color
pactl list sinks
pactl list sinks |grep -E 'Name:|State:' --color


# pw-link alsa_output.pci-0000_00_1f.3.analog-stereo.2 alsa_output.pci-0000_00_1f.3.iec958-stereo 
# ODER
# pactl load-module module-combine-sink sink_name=combinedSoundCard slaves=output.pci-0000_00_1f.3.analog-stereo.2,alsa_output.pci-0000_00_1f.3.iec958-stereo 

pactl list modules |grep module-combine-sink -B 2 -A 20 --color

# Beispiel
#Module #536870916
#	Name: module-combine-sink
#
#
# pactl unload-module 536870916
# pactl unload-module module-combined-sink
#
# pw-link output.pci-0000_00_1f.3.analog-stereo.2 alsa_output.pci-0000_00_1f.3.iec958-stereo
#
# journalctr -u pipewire -f
pactl list sinks |grep -E 'Name:|State:' --color#
# systemctl --user restart pipewire
#
#
#
pactl list modules |grep module-combine-sink -B 2 -A 20 --color

echo ----

pactl load-module module-combine-sink sink_name=combined slaves=alsa_output.pci-0000_00_1f.3.analog-stereo alsa_output.pci-0000_00_1f.3.iec958-stereo

echo ----

pactl list modules |grep module-combine-sink -B 2 -A 20 --color
