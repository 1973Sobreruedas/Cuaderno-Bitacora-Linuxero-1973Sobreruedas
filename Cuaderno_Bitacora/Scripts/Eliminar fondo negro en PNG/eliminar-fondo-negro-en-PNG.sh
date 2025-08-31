#!/bin/bash

# Script para convertir fondo negro a transparencia en todos los PNG de la carpeta actual
# Requiere ImageMagick

echo "🧽 Iniciando proceso de limpieza de fondos negros..."

# Verifica si la carpeta ya existe
if [ -d "transparente" ]; then
    echo "⚠️ La carpeta 'transparente' ya existe. Elimina o renombra antes de continuar."
    exit 1
fi

mkdir -p transparente

for img in *.png; do
    echo "🖼️ Procesando: $img"
    convert "$img" -fuzz 10% -transparent "#000000" "transparente/$img"
done

echo "✅ Proceso completado. Revisa la carpeta ./transparente"
