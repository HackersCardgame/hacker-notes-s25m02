#!/bin/bash

# Setze die Ziel-Datei für .asoundrc
ASOUNDRC_FILE="./.asoundrc"

# Lösche die vorherige .asoundrc, wenn sie existiert
> "$ASOUNDRC_FILE"

# Finde alle Karten, die 'cm106' im Namen haben
for card in $(cat /proc/asound/cards | grep -i 'ICUSB' | awk '{print $1}'); do
    # Hole den Namen der Karte, z.B. 'CM106 Like Sound Device'
    card_name=$(cat /proc/asound/cards | grep -i "card $card" | awk -F ' ' '{print $3" "$4" "$5" "$6}')
    
    # Füge PCM- und CTL-Einträge für die Karte hinzu
    echo "### Karte $card ($card_name)" >> "$ASOUNDRC_FILE"
    echo "pcm.card$card {" >> "$ASOUNDRC_FILE"
    echo "    type hw" >> "$ASOUNDRC_FILE"
    echo "    card $card" >> "$ASOUNDRC_FILE"
    echo "}" >> "$ASOUNDRC_FILE"
    echo "" >> "$ASOUNDRC_FILE"

    echo "ctl.card$card {" >> "$ASOUNDRC_FILE"
    echo "    type hw" >> "$ASOUNDRC_FILE"
    echo "    card $card" >> "$ASOUNDRC_FILE"
    echo "}" >> "$ASOUNDRC_FILE"
    echo "" >> "$ASOUNDRC_FILE"
    
    # Füge Subgeräte hinzu
    for subdevice in $(cat /proc/asound/pcm | grep "^$card" | awk -F ':' '{print $1}'); do
        subdevice_name=$(cat /proc/asound/pcm | grep "$subdevice" | awk '{print $3}')
        
        # Eintrag für PCM und CTL für Subgeräte
        echo "pcm.${subdevice}_card$card {" >> "$ASOUNDRC_FILE"
        echo "    type hw" >> "$ASOUNDRC_FILE"
        echo "    card $card" >> "$ASOUNDRC_FILE"
        echo "    device $subdevice" >> "$ASOUNDRC_FILE"
        echo "}" >> "$ASOUNDRC_FILE"
        echo "" >> "$ASOUNDRC_FILE"

        echo "ctl.${subdevice}_card$card {" >> "$ASOUNDRC_FILE"
        echo "    type hw" >> "$ASOUNDRC_FILE"
        echo "    card $card" >> "$ASOUNDRC_FILE"
        echo "    device $subdevice" >> "$ASOUNDRC_FILE"
        echo "}" >> "$ASOUNDRC_FILE"
        echo "" >> "$ASOUNDRC_FILE"
    done
done

echo ".asoundrc wurde erfolgreich erstellt!"
