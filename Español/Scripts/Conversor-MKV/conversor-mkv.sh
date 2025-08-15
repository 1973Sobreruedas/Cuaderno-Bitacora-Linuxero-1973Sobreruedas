#!/bin/bash

# Script de conversión de archivos de vídeo a formato MKV (H.265)
# por 1973Sobreruedas
# Proyecto en GitHub: https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas (Español / Inglés)
# Proyecto en Internet: https://manualdesupervivenciaLinux.com (Sólo en español)
# Compatible con Debian, Ubuntu, Linux Mint, Fedora y OpenSUSE.
# Supervisado y testado con ChatGPT (OpenAI)
# Licencia: CC BY-NC-SA 4.0 - Compartir igual, sin uso comercial y con atribución.
# Versión 1.3

# Variables
selec_gris='\e[90;5m'
selec_verde='\e[32m'
NC='\e[0m'
VERSION_LOCAL="1.3"

# Menú
echo "==============================================="
echo "     Conversión de archivos de vídeo a MKV     "
echo "                (formato H.265)                "
echo "                                               "
echo "         Manual de Supervivencia Linux         "
echo "    https://manualdesupervivenciaLinux.com     "
echo "       Supervisado con ChatGPT – OpenAI        "
echo "==============================================="
echo ""

# Verificar actualización disponible
check_version() {
  VERSION_REPO=$(curl -s https://raw.githubusercontent.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas/main/English/Scripts/MKV%20Converter/VERSION | head -n1)

  echo "📦 Versión local: $VERSION_LOCAL"
  echo "🌐 Última versión publicada: $VERSION_REPO"

  if [[ "$VERSION_LOCAL" != "$VERSION_REPO" ]]; then
    echo -e "\n⚠️  ¡Hay una nueva versión disponible!"
    echo -e "\n   🔗    🇪🇸 Repositorio (Español):"
    echo "   🔗 https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas/tree/main/Espa%C3%B1ol/Scripts/Conversor-MKV"
    echo -e "\n   🔗 🇬🇧 🇺🇸 Repository (English):"
    echo "   🔗 https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas/tree/main/English/Scripts/MKV%20Converter"
    echo -e "\n "
  else
    echo -e "\n✅ Estás usando la última versión disponible."
    echo -e "\n "
  fi
}

if [[ "$1" == "--verificar" || "$1" == "--check-version" ]]; then
  check_version
  exit 0
fi

# Programa
echo "Conversor MKV versión 1.3"
echo -e "\n\nProblemas, bugs e inconsistencias reportarlo a\nhttps://manualdesupervivenciaLinux.com/contacto\n"
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
    pista_audio=0
    echo "🎧 Solo una pista. Usando índice $pista_audio"
    echo "Auto-seleccionada la única pista: $pista_audio" >> "$log"
  else
    # Mostrar por pantalla (con colores)
    echo "🎧 Se han detectado $total_audio pistas de audio:"
    ffprobe -v error -select_streams a \
    -show_entries stream=index:stream_tags=language:stream_tags=title \
    -of default=noprint_wrappers=1 "$archivo" |
      awk '
      BEGIN { 
		  idx = 0
		  seleccion = "\033[90;5m"
		  reset = "\033[0m"
	  }
      /^index=/       { idx++; print "Índice mostrado: ", seleccion, idx, reset }
      /TAG:language=/ { print "  Idioma detectado: " $0 }
      /TAG:title=/    { print "  Título pista: " $0 }
      ' | tee -a "$log" | sed 's/^/   /'

    # Guardar en log (sin colores)
    {
      echo ""
      echo "🎧 Se han detectado $total_audio pistas de audio:"
        ffprobe -v error -select_streams a \
        -show_entries stream=index:stream_tags=language:stream_tags=title \
        -of default=noprint_wrappers=1 "$archivo"
    } >> "$log"

    echo ""
    echo -ne "👉 ¿Qué pista de audio deseas conservar (${selec_gris}número de índice${NC})? "
	read seleccion_usuario
    if ! [[ "$seleccion_usuario" =~ ^[0-9]+$ ]] || [[ "$seleccion_usuario" -lt 1 ]]; then
      echo "❌ Entrada inválida. Introduce un número entero mayor que 0." >&2
      exit 1
    fi
    pista_audio=$((seleccion_usuario - 1))
    echo "Usuario seleccionó: $pista_audio" >> "$log"
  fi

  size_original=$(du -b "$archivo" | cut -f1)

    # Conversión del archivo
    ffmpeg -i "$archivo" -map 0:v:0 -map 0:a:$pista_audio -map 0:s? -c:v libx265 -preset slow -crf 21 -c:a copy -c:s copy "$salida"

    # Fin de cronómetro
    fin=$(date +%s)
    tiempo=$((fin - inicio))

    # Evaluar si el archivo se generó correctamente
    if [[ -f "$salida" ]]; then
      size_final=$(du -b "$salida" | cut -f1)
      compresion=$(awk "BEGIN {printf \"%.2f\", (1 - $size_final / $size_original) * 100}")
    else
      size_final=0
      compresion="–"
fi

  echo "" >> "$log"
  echo "Tamaño original: $((size_original / 1024 / 1024)) MB" >> "$log"
  echo "Tamaño final:    $((size_final / 1024 / 1024)) MB" >> "$log"
  echo "Compresión lograda: $compresion%" >> "$log"
  echo "Tiempo:          ${tiempo}s" >> "$log"

  echo "✅ Terminado: $salida en ${tiempo}s (compresión: $compresion%)"
  echo "----------------------------------------"
  
  echo -e "📦 ${selec_verde}Archivo convertido:${NC} $salida"
  echo -e "📉 ${selec_verde}Compresión:${NC} $compresion%  | ⏱️ Tiempo: ${tiempo}s"

done
