#!/bin/bash

# Video file conversion script to MKV format (H.265)
# by 1973Sobreruedas
# GitHub project: https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas (Spanish / English)
# Project website: https://manualdesupervivenciaLinux.com (Spanish only)
# Compatible with Debian, Ubuntu, Linux Mint, Fedora and OpenSUSE.
# Supervised and tested with ChatGPT (OpenAI)
# License: CC BY-NC-SA 4.0 - Share alike, non-commercial, with attribution.
# Version 1.3

# Variables
selec_gris='\e[90;5m'
selec_verde='\e[32m'
NC='\e[0m'
VERSION_LOCAL="1.3"

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

# Check for available update
check_version() {
  VERSION_REPO=$(curl -s https://raw.githubusercontent.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas/main/English/Scripts/MKV%20Converter/VERSION | head -n1)

  echo "📦 Local version: $VERSION_LOCAL"
  echo "🌐 Latest published version: $VERSION_REPO"

  if [[ "$VERSION_LOCAL" != "$VERSION_REPO" ]]; then
    echo -e "\n⚠️  A new version is available!"
    echo -e "\n   🔗 🇬🇧 🇺🇸 Repository (English):"
    echo "   🔗 https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas/tree/main/English/Scripts/MKV%20Converter"
    echo -e "\n   🔗    🇪🇸 Repositorio (Español):"
    echo "   🔗 https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas/tree/main/Espa%C3%B1ol/Scripts/Conversor-MKV"
    echo -e "\n "
  else
    echo -e "\n✅ You are using the latest available version."
    echo -e "\n "
  fi
}

if [[ "$1" == "--verificar" || "$1" == "--check-version" ]]; then
  check_version
  exit 0
fi

# Program
echo "MKV Converter version 1.3"
echo -e "\n\nTo report bugs or issues, visit:\nhttps://manualdesupervivenciaLinux.com/contacto\n"
mkdir -p logs

for archivo in *.mkv; do
  inicio=$(date +%s)
  nombre_base="${archivo%.mkv}"
  salida="${nombre_base} [H265].mkv"
  log="logs/${nombre_base}.log"

  echo ""
  echo "🎬 Processing: $archivo"
  echo "📄 Log file: $log"
  echo "=======================================" > "$log"
  echo "File: $archivo" >> "$log"
  echo "" >> "$log"

  pistas_audios=($(ffprobe -v error -select_streams a -show_entries stream=index -of csv=p=0 "$archivo"))
  total_audio=${#pistas_audios[@]}
  echo "Detected audio tracks: $total_audio" >> "$log"

  if [[ "$total_audio" -eq 1 ]]; then
    pista_audio=0
    echo "🎧 Only one track found. Using index $pista_audio"
    echo "Auto-selected the only track: $pista_audio" >> "$log"
  else
    # Display on screen (with colors)
    echo "🎧 $total_audio audio tracks detected:"
    ffprobe -v error -select_streams a \
    -show_entries stream=index:stream_tags=language:stream_tags=title \
    -of default=noprint_wrappers=1 "$archivo" |
      awk '
      BEGIN {
          idx = 0
          seleccion = "\033[90;5m"
          reset = "\033[0m"
      }
      /^index=/       { idx++; print "Displayed index: ", seleccion, idx, reset }
      /TAG:language=/ { print "  Detected language: " $0 }
      /TAG:title=/    { print "  Track title: " $0 }
      ' | tee -a "$log" | sed 's/^/   /'

    # Save to log (without colors)
    {
      echo ""
      echo "🎧 $total_audio audio tracks detected:"
        ffprobe -v error -select_streams a \
        -show_entries stream=index:stream_tags=language:stream_tags=title \
        -of default=noprint_wrappers=1 "$archivo"
    } >> "$log"

    echo ""
    echo -ne "👉 Which audio track do you want to keep (${selec_gris}index number${NC})? "
	read seleccion_usuario
    if ! [[ "$seleccion_usuario" =~ ^[0-9]+$ ]] || [[ "$seleccion_usuario" -lt 1 ]]; then
      echo "❌ Invalid input. Please enter an integer greater than 0." >&2
      exit 1
    fi
    pista_audio=$((seleccion_usuario - 1))
    echo "User selected: $pista_audio" >> "$log"
  fi

  size_original=$(du -b "$archivo" | cut -f1)    

    # File conversion with ffmpeg
    ffmpeg -i "$archivo" -map 0:v:0 -map 0:a:$pista_audio -map 0:s? -c:v libx265 -preset slow -crf 21 -c:a copy -c:s copy "$salida"

    # Stop the timer
    fin=$(date +%s)
    tiempo=$((fin - inicio))

    # Evaluate output only if the file was successfully created
    if [[ -f "$salida" ]]; then
      size_final=$(du -b "$salida" | cut -f1)
      compresion=$(awk "BEGIN {printf \"%.2f\", (1 - $size_final / $size_original) * 100}")
    else
      size_final=0
      compresion="–"
    fi

  echo "" >> "$log"
  echo "Original size: $((size_original / 1024 / 1024)) MB" >> "$log"
  echo "Final size:    $((size_final / 1024 / 1024)) MB" >> "$log"
  echo "Compression achieved: $compresion%" >> "$log"
  echo "Duration:      ${tiempo}s" >> "$log"

  echo "✅ Done: $salida in ${tiempo}s (compression: $compresion%)"
  echo "----------------------------------------"

  echo -e "📦 ${selec_verde}Converted file:${NC} $salida"
  echo -e "📉 ${selec_verde}Compression:${NC} $compresion%  | ⏱️ Time: ${tiempo}s"

done
