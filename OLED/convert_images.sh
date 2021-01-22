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
idir=/home/$USER/Pimiga_mini/OLED/
odir=/home/$USER/Pimiga_mini/OLED/
resize=128x64
ext=jpg
depth=2
usage() {
  echo "USAGE"
  echo "  $(basename $0) -i dir -o dir [-r resizing] [-e extension]"
  echo
  echo "              DESCRIPTION     "
  echo "  Resize all images for OLED Display. Requires ImageMagick."
  echo 
  echo "OPTIONS                                             [DEFAULT]"

  echo "  -r: Resize specification (ImageMagick syntax)     [128x64]"
  echo "  -e: File extension of images in input directory   [jpg]"
}
[[ "$1" = -h ]] && { usage; exit; }

[[ $(which convert) = "" ]] && \
  { echo "Error: ImageMagick not installed"; exit 1; }

while getopts ":i:o:r:e:" opt; do
  case $opt in
    i) idir=${OPTARG%/}; ;;  # Remove trailing slash if present
    o) odir=${OPTARG%/}; ;;  # Remove trailing slash if present
    r) resize=$OPTARG;   ;;
    e) ext=$OPTARG;      ;;
    \?) echo "Error: invalid option: -$OPTARG";             exit 1 ;;
    :)  echo "Error: option -$OPTARG requires an argument"; exit 1 ;;
  esac
done

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
