#!/bin/bash

pactl load-module module-combine-sink sink_name=SPDIFanalog slaves=alsa_output.pci-0000_00_1f.3.iec958-stereo alsa_output.pci-0000_00_1f.3.analog-stereo
