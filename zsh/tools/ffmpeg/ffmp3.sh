#!/bin/zsh
for file in "$@"; do
  output="${file%.*}.mp3"
  /opt/homebrew/bin/ffmpeg -i "$file" -c:a libmp3lame -qscale:a 0 "$output"
done
