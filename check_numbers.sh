#!/bin/bash
set -ex
# Nazwa pliku do sprawdzenia
FILE="public/list.txt"

# Sprawdzenie, czy plik istnieje
if [ ! -f "$FILE" ]; then
  echo "Plik $FILE nie istnieje."
  exit 1
fi

# Sprawdzenie, czy plik zawiera liczby całkowite po przecinku
if grep -qE '([0-9]+,)*[0-9]+' "$FILE"; then
  echo "Plik zawiera liczby całkowite po przecinku."
else
  echo "Plik nie zawiera liczb całkowitych po przecinku."
fi
