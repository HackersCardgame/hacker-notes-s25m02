#!/bin/bash

#sudo apt-get install jackd2 qjackctl pulseaudio-module-jack

echo alsa_in / _out in :
which alsa_in alsa_out

aplay -l
amidi -l

# Name der logischen Soundkarte
device_name="multi_soundcard"

# Prüfen, ob JACK läuft
if ! pgrep -x "jackd" > /dev/null; then
    echo "JACK läuft nicht. Starte JACK..."
    #jackd -d alsa -d hw:0 -r 48000 -p 1024 -n 3 &
    sleep 5
fi

# Liste aller Soundkarten holen
soundcards=$(aplay -l | grep "card" | awk '{print $2}' | sed 's/://')
echo ================================
echo Sondcards:
echo $soundcards
echo ================================


# Erstelle eine Multisoundkarte mit allen Geräten
for card in $soundcards; do
    echo "Füge Soundkarte hw:$card hinzu..."
    alsa_in -j "soundcard_$card" -d hw:$card -r 48000 &
    alsa_out -j "soundcard_$card" -d hw:$card -r 48000 &
    sleep 1
done

# Bestätigung
echo "Alle Soundkarten wurden zu einer logischen Soundkarte zusammengefasst."

