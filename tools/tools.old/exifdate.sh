#!/bin/bash

# Überprüfen, ob exiftool installiert ist
if ! command -v exiftool &>/dev/null; then
    echo "Error: exiftool is not installed."
    apt-get install libimage-exiftool-perl
    exit 1
fi

# Überprüfen, ob ein Verzeichnis übergeben wurde
if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

DIRECTORY="$1"

# Überprüfen, ob das Verzeichnis existiert
if [[ ! -d "$DIRECTORY" ]]; then
    echo "Error: Directory $DIRECTORY does not exist."
    exit 1
fi

# Dateien im Verzeichnis durchgehen
for file in "$DIRECTORY"/*; do
    if [[ -f "$file" ]]; then
        # Originaldateiname ohne Erweiterung
        base_name=$(basename "$file")
        base_name_no_ext="${base_name%.*}"
        ext="${file##*.}"

        # EXIF-Datum extrahieren
        exif_date=$(exiftool -s -s -s -DateTimeOriginal "$file" 2>/dev/null)

        if [[ -n "$exif_date" ]]; then
            # EXIF-Datum formatieren (YYYYMMDD)
            formatted_date=$(echo "$exif_date" | awk '{print $1}' | tr ':' '-')
            formatted_date=$(date -d "$formatted_date" +"%Y%m%d" 2>/dev/null)
            if [[ $? -eq 0 ]]; then
                # Datei mit EXIF-Datum umbenennen
                new_name="${base_name_no_ext}.${formatted_date}.${ext}"
            else
                echo "Error parsing date for $file. Skipping."
                continue
            fi
        else
            # Kein EXIF-Datum, Datei als 'noEXIF' markieren
            new_name="${base_name_no_ext}.noEXIF.${ext}"
        fi

        # Datei umbenennen
        new_path="$DIRECTORY/$new_name"
        echo "Renaming: $file -> $new_path"
        mv "$file" "$new_path"
    fi
done

echo "Processing completed."


