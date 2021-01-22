#!/bin/bash

for i in *.png; do
    printf "Resize $i\n"
    convert "$i" -resize 300x300 "$i"
done
