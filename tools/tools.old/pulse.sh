#!/bin/bash

echo "

load-module module-combine-sink sink_name=combined
set-default-sink combined

" >> ~/.config/pulse/default.pa

pactl list short sinks


echo "

load-module module-combine-sink sink_name=combined slaves=alsa_output.usb-Solid_State_System_Co._Ltd._USB_PnP_Audio_Device_000000000000-00.analog-stereo,alsa_output.usb-046d_G435_Wireless_Gaming_Headset_V001008005.1-01.analog-stereo

" >> ~/.config/pulse/default.pa
