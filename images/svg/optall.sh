!#!/bin/bash

for file in ./*.svg; do
  svgo "$file" --multipass --precision=0
done
