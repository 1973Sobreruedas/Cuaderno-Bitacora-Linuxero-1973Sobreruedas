#!/bin/bash

# Video file conversion script to MKV format (H.265)
# by 1973Sobreruedas
# GitHub project: https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas (Spanish / English)
# Project website: https://manualdesupervivenciaLinux.com (Spanish only)
# Compatible with Debian, Ubuntu, Linux Mint, Fedora and OpenSUSE.
# Supervised and tested with ChatGPT (OpenAI)
# License: CC BY-NC-SA 4.0 - Share alike, non-commercial, with attribution.
# Video conversion script to MKV (H.265) – Version 1.1

# Variables
selec_gray='\e[90;5m'
selec_green='\e[32m'
NC='\e[0m'

# Header
echo "==============================================="
echo "      Video File Conversion to MKV Format      "
echo "                 (H.265 codec)                 "
echo "                                               "
echo "         Manual de Supervivencia Linux         "
echo "     https://manualdesupervivenciaLinux.com    "
echo "         Supervised by ChatGPT – OpenAI        "
echo "==============================================="
echo ""

# Program
echo "MKV Converter version 1.1"
echo -e "\n\nTo report bugs or issues, visit:\nhttps://manualdesupervivenciaLinux.com/contacto\n"
mkdir -p logs

for file in *.mkv; do
  start=$(date +%s)
  base_name="${file%.mkv}"
  output="${base_name} [H265].mkv"
  log="logs/${base_name}.log"

  echo ""
  echo "🎬 Processing: $file"
  echo "📄 Log file: $log"
  echo "=======================================" > "$log"
  echo "File: $file" >> "$log"
  echo "" >> "$log"

  audio_tracks=($(ffprobe -v error -select_streams a -show_entries stream=index -of csv=p=0 "$file"))
  total_audio=${#audio_tracks[@]}
  echo "Detected audio tracks: $total_audio" >> "$log"

  if [[ "$total_audio" -eq 1 ]]; then
    audio_track="${audio_tracks[0]}"
    echo "🎧 Only one track found. Using index $audio_track"
    echo "Auto-selected the only track: $audio_track" >> "$log"
  else
    echo "🎧 $total_audio audio tracks detected:" | tee -a "$log"
    ffprobe -v error -select_streams a \
    -show_entries stream=index:stream_tags=language:stream_tags=title \
    -of default=noprint_wrappers=1 "$file" |
      awk '
      BEGIN {
          idx = 0
          gray = "\033[90;5m"
          reset = "\033[0m"
      }
      /^index=/       { idx++; print "Displayed index: ", gray, idx, reset }
      /TAG:language=/ { print "  Detected language: " $0 }
      /TAG:title=/    { print "  Track title: " $0 }
      ' | tee -a "$log" | sed 's/^/   /'
    echo ""
    echo -ne "👉 Which audio track do you want to keep (${selec_gray}index number${NC})? "
    read user_selection
    if ! [[ "$user_selection" =~ ^[0-9]+$ ]] || [[ "$user_selection" -lt 1 ]]; then
      echo "❌ Invalid input. Please enter an integer greater than 0." >&2
      exit 1
    fi
    audio_track=$((user_selection - 1))
    echo "User selected: $audio_track" >> "$log"
  fi

  original_size=$(du -b "$file" | cut -f1)

  ffmpeg -i "$file" -map 0:v:0 -map 0:a:$audio_track -map 0:s -c:v libx265 -preset slow -crf 21 -c:a copy -c:s copy "$output"

  final_size=$(du -b "$output" | cut -f1)
  end=$(date +%s)
  duration=$((end - start))
  compression=$(awk "BEGIN {printf \"%.2f\", (1 - $final_size / $original_size) * 100}")

  echo "" >> "$log"
  echo "Original size: $((original_size / 1024 / 1024)) MB" >> "$log"
  echo "Final size:    $((final_size / 1024 / 1024)) MB" >> "$log"
  echo "Compression achieved: $compression%" >> "$log"
  echo "Duration:      ${duration}s" >> "$log"

  echo "✅ Done: $output in ${duration}s (compression: $compression%)"
  echo "----------------------------------------"

  echo -e "📦 ${selec_green}Converted file:${NC} $output"
  echo -e "📉 ${selec_green}Compression:${NC} $compression%  | ⏱️ Time: ${duration}s"

done

