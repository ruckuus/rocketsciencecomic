#!/usr/bin/env bash

INPUT_FILE=$1
[ -z $INPUT_FILE ] && echo "No file meh?" && exit 1
INPUT=$(echo $INPUT_FILE | sed 's/\..*$//g')
PNM=${INPUT}.pnm
BITMAP=${INPUT}.pbm
EPS=${INPUT}.eps
OUTPUT=${INPUT}.png

jpegtopnm $INPUT_FILE > $PNM
mkbitmap -f 10 -s 2 -3 -t 0.45 $PNM -o $BITMAP
potrace $BITMAP -o $EPS
convert -flatten -density 300 $EPS -resize 650x300 ${OUTPUT}

rm -f $PNM $BITMAP $EPS
