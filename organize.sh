#!/bin/bash

TARGET_DIR="$HOME/Downloads"
LOG_FILE="$HOME/file_organizer.log"

cd "$TARGET_DIR" || exit

for file in *; do
  if [[ -f "$file" ]]; then
    case "${file##*.}" in
      pdf|docx|txt)
        DEST="Documents"
        ;;
      jpg|png|svg)
        DEST="Images"
        ;;
      mp4|mkv|avi)
        DEST="Videos"
        ;;
      mp3|wav)
        DEST="Music"
        ;;
      zip|tar.gz|rar)
        DEST="Archives"
        ;;
      *)
        DEST="Others"
        ;;
    esac

    mkdir -p "$DEST"
    mv "$file" "$DEST/"
    echo "$(date): Moved '$file' to '$DEST/'" >> "$LOG_FILE"
  fi
done
