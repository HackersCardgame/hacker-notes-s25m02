#!/bin/bash

echo wandle $1
echo press any key
read
echo dass etwas passiert sieht man mit lsof |grep png$ -P


# Überprüfen, ob ein PDF-Dateipfad als Argument übergeben wurde
if [ -z "$1" ]; then
  echo "Bitte geben Sie eine PDF-Datei als Argument an."
  exit 1
fi

# Eingabedatei und temporäres Verzeichnis definieren
input_pdf="$1"
output_pdf="output_ocr.pdf"
temp_dir=$(mktemp -d)

# Überprüfen, ob pdfimages und tesseract installiert sind
if ! command -v pdfimages &> /dev/null || ! command -v tesseract &> /dev/null; then
  echo "Dieses Skript benötigt 'pdfimages' und 'tesseract'. Bitte installieren Sie diese."
  exit 1
fi

# Schritt 1: PDF in PNG-Bilder umwandeln
pdfimages -png "$input_pdf" "$temp_dir/page"

# Schritt 2: OCR auf jede Bildseite anwenden und zu PDF-Dateien zusammenführen
for image in "$temp_dir"/page*.png; do
  tesseract "$image" "${image%.png}" pdf
done

# Schritt 3: Einzelne PDF-Dateien zusammenfügen
pdfunite "$temp_dir"/*.pdf "$output_pdf"

# Temporäre Dateien aufräumen
rm -r "$temp_dir"

echo "OCR abgeschlossen. Die durchsuchbare PDF-Datei ist: $output_pdf"
