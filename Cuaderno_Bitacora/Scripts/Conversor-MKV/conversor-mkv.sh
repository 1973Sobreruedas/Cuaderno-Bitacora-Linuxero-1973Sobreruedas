#!/bin/bash

# MSL / CBL - Script de conversión de archivos de vídeo a formato MKV (H.265)
# Autor: @1973Sobreruedas
# Proyecto en GitHub: https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas (Español)
# Proyecto en Internet: https://manualdesupervivenciaLinux.com (Español)
# Compatible con:
#           * LiNUX MINT MATE *
#           Debian y derivados (Ubuntu, etc.)
#           Fedora
#           OpenSUSE
#           Arch y derviados (Manjaro, EndeavourOS, Garuda, etc.)
# Escritorios compatibles:
#           MATE
#           GNOME
#           Cinnammon
#           XFCE
#           LXQt
#           KDE/Plasma * Ver el README.md
# Supervisado y testado con ChatGPT (OpenAI)
# Licencia: CC BY-NC-SA 4.0 - Compartir igual, sin uso comercial y con atribución.
# Versión 1.5 - 05-10-2025

# ============ Sección de errores =============
trap '' SIGINT SIGTERM
set -uo pipefail
    # Se activa nullglob para que *.mkv no se expanda a literal, para evitar problemas si no hay archivos.
    # Con extglob se evita que los MKV ya recodificados se vuelvan a recodificar.
shopt -s extglob nullglob
clear

# ============ Variables =============
gris='\e[90;5m'
verde='\e[32m'
rojo='\e[31m'
amarillo='\e[33m'
color_reset='\e[0m'
LOGS_DIR="logs"
VERSION_LOCAL="1.5"
    # Contadores para resumen
convertidos=0
omitidos=0
errores=0

# ============= Utilidades =============
decir() { printf "%b\n" "$*"; }   # pantalla con colores, emojis, formato
quitar_ansi() { sed -r 's/\x1B\[[0-9;]*[A-Za-z]//g'; }   # salida para log sin formato

archivo_log=""  # se establece por archivo en el bucle
registrar() { printf "%b\n" "$*" | quitar_ansi >> "$archivo_log"; }

abortar() { decir "${rojo}ERROR:${color_reset} $*"; exit 1; }

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
echo -e "\nProblemas, bugs e inconsistencias reportarlo a\nhttps://manualdesupervivenciaLinux.com/contacto\n"

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

# Parámetros (soporta --verificar / --check-version)
if [[ $# -gt 0 && ( "$1" == "--verificar" || "$1" == "--check-version" ) ]]; then
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

    # Guarda los archivos en un array
archivos=( !(*[Hh]265*).mkv )

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

    # Bucle principal, arrancando la conversión
for archivo in "${archivos[@]}"; do
  inicio=$(date +%s)
  nombre_base="${archivo%.mkv}"
  salida="${archivo%.*} [H265].mkv"
  log="logs/${nombre_base}.log"
  archivo_log="$log"

      # Comprobación anti sobreescritura
      if [[ -f "$salida" ]]; then
        decir "⚠️  El archivo '$salida' ya existe. Se omite."
        ((omitidos++))
        continue
      fi

  decir " \n \e[1;33m  Conversión\e[0m"
  decir "🎬 Procesando: $archivo"
  decir "📄 Registro: $log"

    # Cabecera del log
  echo "=======================================" > "$archivo_log"
  registrar "Archivo: $archivo"
  registrar ""

    # Detección de pistas de audio
  pistas_audio=($(ffprobe -v error -select_streams a -show_entries stream=index -of csv=p=0 "$archivo"))
  total_audio=${#pistas_audio[@]}
  registrar "Pistas de audio encontradas: $total_audio"

# ==== Selección de pista (pantalla con color + Log limpio) ====
if [[ "$total_audio" -eq 0 ]]; then
  decir "${amarillo}Aviso:${color_reset} No se detectaron pistas de audio. Se copiarán vídeo/subtítulos si existen."
  registrar "Aviso: No se detectan audios."
  pista_audio=""
elif [[ "$total_audio" -eq 1 ]]; then
  pista_audio=0
  seleccion_usuario=1
  decir "🎧 Solo una pista. Seleccionada automáticamente ${gris}1${color_reset}."
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
  # Selección de audio por el usuario, si hay error en la elección vuelve a preguntar
    while true; do
       printf "👉 ¿Qué pista de audio deseas conservar (${gris}número de índice${color_reset})? "
       read -r seleccion_usuario
    if [[ "$seleccion_usuario" =~ ^[0-9]+$ ]] && [[ "$seleccion_usuario" -ge 1 ]] && [[ "$seleccion_usuario" -le "$total_audio" ]]; then
    break
    fi
       echo "❌ Entrada inválida. Introduce el número de audio a guardar de entre 1 y ${total_audio} que tiene el vídeo."
    done

  # Índice real para ffmpeg (0-based), pero SÓLO se registra lo que vio el usuario
  pista_audio=$((seleccion_usuario - 1))
  registrar "Usuario seleccionó: $seleccion_usuario"
fi

  tamano_original=$(du -b "$archivo" | cut -f1)
    # ================= Conversión del archivo =================
    # Prepara el mapeo de audio sólo si existe pista
  if [[ -n "$pista_audio" ]]; then
    mapa_audio=(-map "0:a:$pista_audio" -c:a copy)
  else
    mapa_audio=()
  fi

  cmd=(
    ffmpeg -nostdin -stats -loglevel error -stats_period 3
    -i "$archivo"
    -map "0:v:0" -c:v libx265 -preset slow -crf 21
    "${mapa_audio[@]}"
    -map "0:s?" -c:s copy
    "$salida"
  )

  if "${cmd[@]}" < /dev/null; then
    fin=$(date +%s)
    tiempo=$((fin-inicio))
    tamano_original=$(du -b "$archivo" | cut -f1)
    tamano_final=$(du -b "$salida" | cut -f1)
    compresion=$(awk "BEGIN {printf \"%.2f\", (1 - $tamano_final / $tamano_original) * 100}")
    registrar "Finalizado: $(date '+%d-%m-%Y %H:%M:%S')"
    registrar "Tamaño original: $((tamano_original / 1024 / 1024)) MB"
    registrar "Tamaño final:    $((tamano_final / 1024 / 1024)) MB"
    registrar "Compresión: $compresion%"
    registrar "Tiempo: ${tiempo}s"
    decir "✅ Terminado: $salida en ${tiempo}s (compresión: $compresion%)"
    ((convertidos++))
  else
    registrar "❌ Error: $(date '+%d-%m-%Y %H:%M:%S')"
    decir "❌ Error al procesar: $archivo"
    ((errores++))
  fi
done

# ——— Resumen final ———
decir "🏁 Conversión terminada."
decir "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
decir "📊 Resumen:"
decir "   ✅ Convertidos : $convertidos"
decir "   ⚠️ Omitidos    : $omitidos"
decir "   ❌ Errores     : $errores"
decir "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
