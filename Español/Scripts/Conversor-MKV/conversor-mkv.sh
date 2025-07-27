#!/bin/bash

# Script de conversión de archivos de vídeo a formato MKV (H.265)
# por 1973Sobreruedas
# Proyecto en GitHub: https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas
# Proyecto en Internet: https://manualdesupervivenciaLinux.com
# Compatible con Debian, Ubuntu, Linux Mint, Fedora y OpenSUSE.
# Supervisado y testado con ChatGPT (OpenAI)
# Licencia: CC BY-NC-SA 4.0 - Compartir igual, sin uso comercial y con atribución.

echo "==============================================="
echo "     Conversión de archivos de vídeo a MKV     "
echo "                (formato H.265)                "
echo "                                               "
echo "         Manual de Supervivencia Linux         "
echo "    https://manualdesupervivenciaLinux.com     "
echo "       Supervisado con ChatGPT – OpenAI        "
echo "==============================================="
echo ""

mkdir -p logs

for archivo in *.mkv; do
  inicio=$(date +%s)
  nombre_base="${archivo%.mkv}"
  salida="${nombre_base} [H265].mkv"
  log="logs/${nombre_base}.log"

  echo ""
  echo "🎬 Procesando: $archivo"
  echo "📄 Registro: $log"
  echo "=======================================" > "$log"
  echo "Archivo: $archivo" >> "$log"
  echo "" >> "$log"

  pistas_audio=($(ffprobe -v error -select_streams a -show_entries stream=index -of csv=p=0 "$archivo"))
  total_audio=${#pistas_audio[@]}
  echo "Pistas de audio encontradas: $total_audio" >> "$log"

  if [[ "$total_audio" -eq 1 ]]; then
    pista_audio="${pistas_audio[0]}"
    echo "🎧 Solo una pista. Usando índice $pista_audio"
    echo "Auto-seleccionada la única pista: $pista_audio" >> "$log"
  else
    echo "🎧 Se han detectado $total_audio pistas de audio:" | tee -a "$log"
    ffprobe -v error -select_streams a \
    -show_entries stream=index:stream_tags=language:stream_tags=title \
    -of default=noprint_wrappers=1 "$archivo" |
      awk '
      BEGIN { idx = 0 }
      /^index=/       { idx++; print "Índice mostrado: " idx }
      /TAG:language=/ { print "  Idioma detectado: " $0 }
      /TAG:title=/    { print "  Título pista: " $0 }
      ' | tee -a "$log" | sed 's/^/   /'
    echo ""
    read -p "👉 ¿Qué pista de audio deseas conservar (número de índice)? " pista_audio
    pista_audio=$((seleccion_usuario - 1))
    if ! [[ "$seleccion_usuario" =~ ^[0-9]+$ ]] || [[ "$seleccion_usuario" -lt 1 ]]; then
      echo "❌ Entrada inválida. Introduce un número entero mayor que 0." >&2
      exit 1
    fi
    echo "Usuario seleccionó: $pista_audio" >> "$log"
  fi

  size_original=$(du -b "$archivo" | cut -f1)

  ffmpeg -i "$archivo" -map 0:v:0 -map 0:a:$pista_audio -map 0:s -c:v libx265 -preset slow -crf 21 -c:a copy -c:s copy "$salida"

  size_final=$(du -b "$salida" | cut -f1)
  fin=$(date +%s)
  tiempo=$((fin - inicio))
  compresion=$(awk "BEGIN {printf "%.2f", (1 - $size_final / $size_original) * 100}")

  echo "" >> "$log"
  echo "Tamaño original: $((size_original / 1024 / 1024)) MB" >> "$log"
  echo "Tamaño final:    $((size_final / 1024 / 1024)) MB" >> "$log"
  echo "Compresión lograda: $compresion%" >> "$log"
  echo "Tiempo:          ${tiempo}s" >> "$log"

  echo "✅ Terminado: $salida en ${tiempo}s (compresión: $compresion%)"
  echo "----------------------------------------"
done
