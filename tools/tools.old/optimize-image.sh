#!/bin/bash

# Überprüfen, ob die richtigen Argumente übergeben wurden
if [[ $# -ne 2 ]]; then
    echo "Usage: $0 <sourceVerzeichnis> <zielVerzeichnis>"
    exit 1
fi

SOURCE_DIR="$1"
TARGET_DIR="$2"

# Überprüfen, ob ffmpeg installiert ist
if ! command -v ffmpeg &>/dev/null; then
    echo "Error: ffmpeg is not installed."
    exit 1
fi

# Funktion, um ein Bild zu optimieren
optimize_image() {
    local input_file="$1"
    local output_file="$2"

    # Mit ffmpeg optimieren und EXIF-Daten beibehalten
    ffmpeg -i "$input_file" -q:v 2 -map_metadata 0 -y "$output_file" 2>/dev/null
}

# Hauptfunktion: Dateien verarbeiten
process_directory() {
    local current_dir="$1"
    local target_base="$2"

    # Verzeichnisstruktur übernehmen
    mkdir -p "$target_base"

    for file in "$current_dir"/*; do
	    echo II: $file
	    if [[ $(basename "$file") == Motion_20* ]]; then
		    continue
	    fi
        if [[ -d "$file" ]]; then
            # Falls ein Unterverzeichnis, rekursiv verarbeiten
            local sub_dir="${file#$SOURCE_DIR/}"
            process_directory "$file" "$TARGET_DIR/$sub_dir"
        elif [[ -f "$file" ]]; then
            # Nur relevante Bilddateien
            local ext="${file##*.}"
            local ext_lower=$(echo "$ext" | tr '[:upper:]' '[:lower:]')
            if [[ "$ext_lower" =~ ^(png|webp|jpg|jpeg|gif)$ ]]; then
                # Animierte GIFs überspringen
                if [[ "$ext_lower" == "gif" ]]; then
                    if ffmpeg -i "$file" -hide_banner 2>&1 | grep -q "Stream.*Video.*frames"; then
                        echo "Skipping animated GIF: $file"
                        continue
                    fi
                fi

                # Zielpfad erstellen
                local relative_path="${file#$SOURCE_DIR/}"
                local target_file="$TARGET_DIR/${relative_path%.*}.jpg"

                echo "Processing: $file -> $target_file"
                optimize_image "$file" "$target_file"
            fi
        fi
    done
}

# Skript starten
process_directory "$SOURCE_DIR" "$TARGET_DIR"

echo "Optimization completed. Check the files in $TARGET_DIR."

