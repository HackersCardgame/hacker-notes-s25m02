#!/bin/bash

# Setze den Namen des Verzeichnisses für das benutzerdefinierte ISO
CUSTOM_ISO_DIR=~/custom-debian-iso
ISO_OUTPUT_DIR=~/output-iso
TEMPLATE_FILE="/path/to/your/template.jigdo"  # Hier den Pfad zu deinem Jigdo-Template angeben

# Verzeichnis für das Build-Environment erstellen
echo "Erstelle Verzeichnis für benutzerdefiniertes ISO..."
mkdir -p $CUSTOM_ISO_DIR
cd $CUSTOM_ISO_DIR

# Live-Build konfigurieren
echo "Konfiguriere Live-Build..."
lb config

# Liste der installierten Pakete erstellen und in das Build-Verzeichnis verschieben
echo "Füge installierte Pakete hinzu..."
dpkg --get-selections | grep -v deinstalliert > config/package-lists/my-packages.list

# ISO-Build starten
echo "Erstelle das benutzerdefinierte ISO..."
sudo lb build

# Wenn der Build erfolgreich war, das ISO verschieben
if [ $? -eq 0 ]; then
    echo "ISO erfolgreich erstellt. Verschiebe ISO-Datei..."
    mkdir -p $ISO_OUTPUT_DIR
    mv $CUSTOM_ISO_DIR/debian-live*.iso $ISO_OUTPUT_DIR/
    ISO_PATH=$(ls $ISO_OUTPUT_DIR/debian-live*.iso)
else
    echo "Fehler beim Erstellen des ISOs. Abbruch."
    exit 1
fi

# Jigdo-Datei erstellen
echo "Erstelle .jigdo-Datei für das ISO..."
jigdo-file -t $TEMPLATE_FILE -o $ISO_OUTPUT_DIR/$(basename $ISO_PATH .iso).jigdo $ISO_PATH

# Skript abgeschlossen
echo "Erstellung abgeschlossen!"
echo "Benutzerdefiniertes ISO: $ISO_PATH"
echo "Jigdo-Datei: $ISO_OUTPUT_DIR/$(basename $ISO_PATH .iso).jigdo"

