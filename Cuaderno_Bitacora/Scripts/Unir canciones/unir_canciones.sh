#!/bin/bash

ext="mp3"

echo -e "Une los archivos MP3 del directorio para crear un sólo archivo"

# Preguntar por el nombre del archivo de salida
echo "Por favor, ingresa el nombre del archivo de salida (sin extensión):"
read nombre


# Añadir la extensión al nombre de archivo proporcionado
salida="$nombre.$ext"

# Verificar si existen archivos con la extensión especificada
if ls *.$ext 1> /dev/null 2>&1; then
	# Crear lista de archivos
	echo "Creando lista de archivos $ext..."
	for f in *.$ext; do echo "file '$f'" >> Lista.txt; done

	# Unir archivos MP3
	echo "Unificando archivos MP3 en $salida..."
	ffmpeg -f concat -safe 0 -i Lista.txt -c copy "$salida"

	# Eliminar el archivo temporal de lista
	rm Lista.txt

	echo "Proceso completado. Archivo resultante: $salida"
else
    echo "No se encontraron archivos con la extensión .$ext en el directorio actual."
fi

