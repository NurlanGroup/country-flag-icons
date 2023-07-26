#!/bin/bash

sizes=("full" "ico" "sss" "ss" "s" "mmm" "mm" "m" "lll" "ll" "l")
dimensions=("1200x600" "32x16" "100x50" "200x100" "300x150" "600x300" "800x400" "900x450" "1400x700" "1600x800" "1800x900")

for file in *.svg
do
  dir_name="${file%.svg}"
  mkdir -p "$dir_name"
  
  for ((i=0; i<${#sizes[@]}; i++))
  do
    size=${sizes[i]}
    width="${dimensions[i]%%x*}"
    height="${dimensions[i]##*x}"
    cp "$file" "${dir_name}/${size}.svg"
    sed -i.bak "1s/width=\"[0-9]*\" height=\"[0-9]*\"/width=\"$width\" height=\"$height\"/" "${dir_name}/${size}.svg"
    rm "${dir_name}/${size}.svg.bak"
  done
  
  rm "$file"
done
