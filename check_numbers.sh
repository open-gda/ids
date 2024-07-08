#!/bin/bash
set -ex

FILE="public/list.txt"


if [ ! -f "$FILE" ]; then
  echo "Plik $FILE nie istnieje."
  exit 1
fi

if grep -qE '^[0-9]+(,[0-9]+)*$' "$FILE"; then
  echo "Plik should contains only numbers"
else
  echo "Wrong data format"
  exit 1
fi
