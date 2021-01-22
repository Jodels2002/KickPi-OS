#!/bin/bash

for i in *.png; do
    printf "Resize $i\n"
    convert "$i" -resize 128x64\! -depth 2 "$i"

done
