#!/bin/bash

# Script de conversión de archivos de vídeo a formato MKV (H.265)
# por 1973Sobreruedas
# Proyecto en GitHub: https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas (Español / Inglés)
# Proyecto en Internet: https://manualdesupervivenciaLinux.com (Sólo en español)
# Compatible con Debian, Ubuntu, Linux Mint, Fedora y OpenSUSE.
# Supervisado y testado con ChatGPT (OpenAI)
# Licencia: CC BY-NC-SA 4.0 - Compartir igual, sin uso comercial y con atribución.
# Versión 1.4

# ============ Variables =============
selec_gris='\e[90;5m'
selec_verde='\e[32m'
selec_rojo='\e[31m'
selec_amarillo='\e[33m'
selec_reset='\e[0m'
LOGS_DIR="logs"
VERSION_LOCAL="1.4"

# ============= Utilidades =============
decir() { printf "%b\n" "$*"; }   # pantalla con colores, emojis, formato
quitar_ansi() { sed -r 's/\x1B\[[0-9;]*[A-Za-z]//g'; }   # salida para log sin formato

archivo_log=""  # se establece por archivo en el bucle
registrar() { printf "%b\n" "$*" | quitar_ansi >> "$archivo_log"; }

abortar() { decir "${selec_rojo}ERROR:${selec_reset} $*"; exit 1; }

# ================ Menú ================
echo "==============================================="
echo "     Conversión de archivos de vídeo a MKV     "
echo "                (formato H.265)                "
echo "                                               "
echo "         Manual de Supervivencia Linux         "
echo "    https://manualdesupervivenciaLinux.com     "
echo "       Supervisado con ChatGPT – OpenAI        "
echo "==============================================="
echo ""
echo "Conversor MKV versión $VERSION_LOCAL"
echo -e "\n\nProblemas, bugs e inconsistencias reportarlo a\nhttps://manualdesupervivenciaLinux.com/contacto\n"

# = Verificar actualización disponible =
check_version() {
  VERSION_REPO=$(curl -s https://raw.githubusercontent.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas/main/Cuaderno_Bitacora/Scripts/MKV%20Converter/VERSION | head -n1)

  decir "📦 Versión local: $VERSION_LOCAL"
  decir "🌐 Última versión publicada: $VERSION_REPO"

  if [[ "$VERSION_LOCAL" != "$VERSION_REPO" ]]; then
    decir "\n⚠️  ¡Hay una nueva versión disponible!"
    decir "\n   🔗    🇪🇸 Repositorio (Español):"
    decir "   🔗 https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas/tree/main/Cuaderno_Bitacora/Scripts/Conversor-MKV"
  else
    decir "\n✅ Estás usando la última versión disponible.\n "
  fi
}

if [[ "$1" == "--verificar" || "$1" == "--check-version" ]]; then
  check_version
  exit 0
fi

# ========= Carpeta Logs =========
if [ ! -d "$LOGS_DIR" ]; then
  mkdir -p -- "$LOGS_DIR" || abortar "No pude crear la carpeta de logs: $LOGS_DIR"
  decir "Creada carpeta de Logs..."
 else
   decir "La carpeta Logs ya existe, no se crea..."
fi

# ============== Programa ==============
# Base
# Comprobar si hay MKV en el directorio

    # Activa nullglob para que *.mkv no se expanda a literal
shopt -s nullglob
    # Guarda los archivos en un array
archivos=( *.mkv )

    # Si no hay ningún MKV, aviso y cierro
if (( ${#archivos[@]} == 0 )); then
  decir "⚠️ No se encontraron archivos .mkv en este directorio."
  exit 0
fi

    # Mostrar listado de archivos a convertir
decir "📂 Archivos a convertir:"
for archivo in "${archivos[@]}"; do
  decir "   - $archivo"
done

    # Arrancando el bucle de conversión
for archivo in "${archivos[@]}"; do
  inicio=$(date +%s)
  nombre_base="${archivo%.mkv}"
  salida="${nombre_base} [H265].mkv"
  log="logs/${nombre_base}.log"
  archivo_log="$log"

  decir " \n"
  decir "🎬 Procesando: $archivo"
  decir "📄 Registro: $log"

    # Cabecera del log
  echo "=======================================" > "$archivo_log"
  registrar "Archivo: $archivo"
  registrar ""

  pistas_audio=($(ffprobe -v error -select_streams a -show_entries stream=index -of csv=p=0 "$archivo"))
  total_audio=${#pistas_audio[@]}
  registrar "Pistas de audio encontradas: $total_audio"

# ==== Selección de pista (pantalla con color + Log limpio) ====
if [[ "$total_audio" -eq 0 ]]; then
  decir "${selec_amarillo}Aviso:${selec_reset} No se detectaron pistas de audio. Se copiarán vídeo/subtítulos si existen."
  registrar "warning=no_audio_tracks_detected"
  pista_audio=""
elif [[ "$total_audio" -eq 1 ]]; then
  pista_audio=0
  seleccion_usuario=1
  decir "🎧 Solo una pista. Seleccionada automáticamente ${selec_gris}1${selec_reset}."
  registrar "Usuario seleccionó: 1"
else
  # Mostrar detalle de pistas (pantalla con color) y enviarlo al log limpio a la vez
  decir "🎧 Se han detectado $total_audio pistas de audio:"
  ffprobe -v error -select_streams a \
    -show_entries stream=index:stream_tags=language:stream_tags=title \
    -of default=noprint_wrappers=1 "$archivo" \
  | awk '
    BEGIN {
      idx = 0;
      gris  = "\033[90;5m";
      reset = "\033[0m";
    }
    /^index=/       { idx++; printf("  Índice mostrado: %s%d%s\n", gris, idx, reset); next; }
    /TAG:language=/ { print "    Idioma detectado: " $0; next; }
    /TAG:title=/    { print "    Título pista: " $0; next; }
  ' | tee >(quitar_ansi >> "$archivo_log") 1>&1

  echo ""
  
  read -rp "$(printf "👉 ¿Qué pista de audio deseas conservar (%snumero de índice%s)? " "$selec_gris" "$selec_reset")" seleccion_usuario

  if ! [[ "$seleccion_usuario" =~ ^[0-9]+$ ]] || [[ "$seleccion_usuario" -lt 1 ]] || [[ "$seleccion_usuario" -gt "$total_audio" ]]; then
    echo "❌ Entrada inválida. Introduce un número entre 1 y ${total_audio}." >&2
    exit 1
  fi

  # Índice real para ffmpeg (0-based), pero SOLO registramos lo que vio el usuario
  pista_audio=$((seleccion_usuario - 1))
  registrar "Usuario seleccionó: $seleccion_usuario"
fi

  size_original=$(du -b "$archivo" | cut -f1)
    # ================= Conversión del archivo =================
    # Prepara el mapeo de audio sólo si existe pista
  if [[ -n "$pista_audio" ]]; then
    mapa_audio=(-map "0:a:${pista_audio}" -c:a copy)
  else
    mapa_audio=()
  fi

  ffmpeg -i "$archivo" -map 0:v:0 -c:v libx265 -preset slow -crf 21 "${mapa_audio[@]}" -map 0:s? -c:s copy "$salida"

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

  registrar "" >> "$log"
  registrar "Tamaño original: $((size_original / 1024 / 1024)) MB" >> "$log"
  registrar "Tamaño final:    $((size_final / 1024 / 1024)) MB" >> "$log"
  registrar "Compresión lograda: $compresion%" >> "$log"
  registrar "Tiempo:          ${tiempo}s" >> "$log"

  decir "✅ Terminado: $salida en ${tiempo}s (compresión: $compresion%)"
  decir "----------------------------------------"
  
  decir "📦 ${selec_verde}Archivo convertido:${selec_reset} $salida"
  decir "📉 ${selec_verde}Compresión:${selec_reset} $compresion%  | ⏱️ Tiempo: ${tiempo}s"

done
