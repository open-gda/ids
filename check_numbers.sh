#!/bin/bash
set -ex

FILE="public/list.txt"


if [ ! -f "$FILE" ]; then
  echo "Plik $FILE nie istnieje."
  exit 1
fi

if grep -qE '^[0-9]+(,[0-9]+)*$' "$FILE"; then
  echo "Plik zawiera wyłącznie liczby całkowite oddzielone przecinkami."
else
  echo "Plik nie zawiera wyłącznie liczb całkowitych oddzielonych przecinkami."
  exit 1
fi
