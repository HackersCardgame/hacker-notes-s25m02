#/bin/bash

aplay /usr/share/lmms/samples/shapes/*.wav

aplay -l |grep ICU


for i in $(aplay -l |grep ICU | cut -d " " -f2 |cut -c1)
do
  echo $i
  amixer -c $i get 'PCM Capture Source'
  echo amixer -c $i set 'PCM Capture Source' 'IEC958 In'
  amixer -c $i set 'PCM Capture Source' 'IEC958 In'
done


echo ==============================
echo input auf IEC958 umgeschaltet
echo aber scheinbar scheint das
echo der jachd beim starten zu resetten
echo mindestens auf der primaeren soundkarte
echo ==============================
echo press any key
#read

#TODO
#/usr/bin/qjackctl -s &
/usr/bin/qjackctl -s -a /home/marc/20250211/session.xml &

echo waiting 5 Seconds
sleep 7

which alsa_in

first=0
for i in $(aplay -l |grep ICU | cut -d " " -f2 |cut -c1)
do
  echo toslink $i input
  alsa_in -j "toslink $i" -d hw:${i} -r 48000 /dev/null &
  if [[ "$first" == "0" ]]
  then
      echo out $i
      echo alsa_out -j "toslink $i" -d hw:${i} -r 48000 >/dev/null &
      alsa_out -j "toslink $i" -d hw:${i} -r 48000 >/dev/null &
      first=1
      fi      
done


echo "

die USB PnP karte macht irgendwie geräusche, bzw. ist es vermutlich sendeinfrastruktur welche Ingress oder Engress produziert, wie auch immer das fachwort für Funksignale heisst die nerven, an rein analog oder ohne jackD verwendeten Raspberries scheinen diese aber das Probelm nicht zu haben

im selben Verzeichnis: usbDevicesUndDAC.jpeg
 * die USB_PnP Karte ist die UGREEN auf dem Foto
 * dann die ICU... Karte ist das blaue Ding
 * für den DAC benötigt man noch ein übergangskabel von Stereo Chinch auf Klinke 3.5 Stecherbuchse ('weiblich'), dann ist es komplett getrennt vom elektrischen stromkreis da der DAC ein eigenes Netzteil hat. ABER braucht man auch nicht weil man hat bei dem cm106 den normalen stereo kopfhörer out und kann es dort anstecken

somit 3 von diesen ICUSBAUDIO (cm106 Chip) dingern mit je 1x spdif in und 1x spdif out verwendet

1x in qJackCtl als HauptSoundKarte (dann sieht man alle 6 ausgänge und kann alle verwenden)
 * Frames 64
 * dann alle geräte auch auf 48000 gestellt
 * 1x SPDIF/TOSLINK in (1. von 3 Inputs)
 * 1x SPDIF/TOSLINK out was an einen TOSLINK DAC (digital audio converter) geht auf die Kopfhörer
 
 
2x mit alsa_in als zusätzliche karten mit alsa_in
 * je 1x SPDIF/TOSLINK in (2. und 3. Gerät)
 
 -> latenz und lag ist so gering dass man das beim Einspielen mit einem Digital Piano über windows ableton dann toslink SPDIF auf Raspi zu Funkkopfhörern nicht merkt und einem auch nicht irritiert beim spieln und nicht mal Real Time vom jackd ist aktiv
 
somit wären die Audio-Brumm-Geräusche ausgemerzt, und das was Ingress/Engress drein geshendet hat jetzt vermutlich auch 

usbpnp=$(aplay -l |grep PnP | cut -d " " -f2 |cut -c1)
alsa_in -j "usb pnp" -d hw:${usbpnp} -r 48000 >/dev/null &



which alsa_out

# /usr/bin/alsa_out -j "onboard_out" -d hw:0 -r 48000 &

/usr/bin/alsa_out -j "usb pnp" -d hw:${usbpnp} -r 48000 >/dev/null &

"

amixer -c 2 set "PCM Capture Source" "IEC958 In"


echo press any key to end ( bzw. im qJack den jackD server beenden )
read

killall alsa_in
killall alsa_out

