#!/bin/bash

# Por 1973Sobreruedas - Proyecto en Github -> https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas
# Script de extración de iconos en los AppImage

# Verifica si se ha proporcionado un archivo AppImage como argumento
if [ -z "$1" ]; then
    echo "Uso: $0 nombre-del-archivo.appimage"
    exit 1
fi

# Guarda el directorio original
ORIGINAL_DIR="$PWD"

# Define el nombre del archivo AppImage y crea los directorios necesarios
APPIMAGE="$1"
EXTRACTION_DIR="squashfs-root"
OUTPUT_DIR="IconosExtraidos"  # Directorio donde se guardarán todos los iconos

# Crea el directorio de salida en el directorio actual
mkdir -p "$OUTPUT_DIR"

# Cambia al directorio donde se encuentra el archivo AppImage
cd "$(dirname "$APPIMAGE")" || exit 1

# Extrae el contenido del AppImage
"./$(basename "$APPIMAGE")" --appimage-extract

# Cambia al directorio de extracción
cd "$EXTRACTION_DIR" || exit 1

# Busca todos los archivos de icono y los copia al directorio de salida
find . -type f \( -name "*.png" -o -name "*.svg" -o -name "*.ico" \) -exec cp {} "$ORIGINAL_DIR/$OUTPUT_DIR/" \;

# Regresa al directorio original y limpia la extracción temporal
cd "$ORIGINAL_DIR"
rm -r "$(dirname "$APPIMAGE")/$EXTRACTION_DIR"

# Verifica si se copiaron iconos
if [ "$(ls -A "$OUTPUT_DIR")" ]; then
    echo "Iconos copiados a $OUTPUT_DIR"
else
    echo "No se encontraron iconos en $APPIMAGE"
fi
