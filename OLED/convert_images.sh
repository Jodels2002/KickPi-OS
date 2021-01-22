#!/bin/bash
# Ist noch nicht fertig... sol mal die "Arbeit" erleichtern :-)"

# Use internal convert: image = Image.open('example.png').resize((disp.width, disp.height), Image.ANTIALIAS).convert('1')
cd
#for i in *.png; do
#    printf "Resize $i\n"
#    convert "$i" -resize 128x64\! -depth 2 "$i"
#done

#------------------------------------------------------------------------------#

set -e

# Default values
idir=/home/$USER/Pimiga_mini/OLED/import_folder/
odir=/home/$USER/Pimiga_mini/OLED/output/folder/
resize=128x64
ext=png
depth=2
usage() {
  echo "Info"
  echo "  Resize all images for OLED Display. Requires ImageMagick."
  echo "  Resize specification                       [128x64]"
  echo "  File extension of images in input directory   [png]"
}
[[ "$1" = -h ]] && { usage; exit; }

[[ $(which convert) = "" ]] && \
  { echo "Error: ImageMagick not installed"; exit 1; }

[[ -z "$idir" ]] && { echo "Error: Must specify input directory";  exit 1; }
[[ -z "$odir" ]] && { echo "Error: Must specify output directory"; exit 1; }

[[ $(shopt -s nullglob; echo "$idir"/*.$ext) = "" ]] \
  && { echo "Error: No files with extension $ext in directory $idir"; exit 1; }

for image in "$idir"/*.$ext; do
  echo -n "Resizing ${image##*/}... "
  # ImageMagick call
  convert "$image"     \
    -colorspace RGB  \
    -resize $resize  \
    -colorspace sRGB \
    -depth=$depth
    "$odir"/$(basename "$image")
  
 done
