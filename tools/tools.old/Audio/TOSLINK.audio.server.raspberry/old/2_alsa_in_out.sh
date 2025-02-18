#!/bin/bash

apt-get install jack2 qjackctl zita-ajbridge


echo "Alle Soundkarten wurden zu einer logischen Soundkarte zusammengefasst."

# Variante 2: Nutzung von ALSA Loopback + zita-a2j
echo "Aktiviere ALSA Loopback-Modul..."
sudo modprobe snd-aloop

# JACK mit Loopback-Gerät starten
echo "Starte JACK mit Loopback-Gerät..."
#jackd -d alsa -d hw:Loopback,0 -r 48000 -p 1024 -n 3 &
sleep 5

# Zita-A2J für jede Soundkarte starten
for card in $soundcards; do
    echo "Füge Soundkarte hw:$card mit zita-a2j hinzu..."
    zita-a2j -d hw:$card -r 48000 &
    sleep 1
done

echo "ALSA Loopback + zita-a2j Setup abgeschlossen."

# Variante 3: Nutzung von JACKs Multi-Device Unterstützung
echo "Starte JACK mit mehreren Soundkarten..."
jackd -d alsa -r 48000 -P hw:0,0 -C hw:1,0 &
sleep 5
echo "JACK Multi-Device Setup abgeschlossen."

