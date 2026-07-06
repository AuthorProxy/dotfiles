#!/bin/zsh
for file in "$@"; do
  output="${file%.*}.mp4"
  /opt/homebrew/bin/HandBrakeCLI -i "$file" -o "$output" --preset="Fast 1080p30"
done
