#!/bin/bash

# por 1973Sobreruedas - Proyecto en Github -> https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas
# Script de actualización de sistema interactivo
# Compatible con Debian/Ubuntu/Mint, Fedora y Arch.

echo "======================================"
echo "    ACTUALIZADOR DE SISTEMAS LINUX    "
echo "======================================"
echo ""
echo "Seleccione su distribución:"
echo "1. Debian y derivados (Linux Mint, Ubuntu)"
echo "2. Fedora"
echo "3. openSUSE"
echo ""
read -p "Ingrese el número correspondiente y pulse [ENTER]: " opcion

case $opcion in
    1)
        echo "Actualizando Debian/Ubuntu/Mint..."
        sudo apt-get update && sudo apt-get -y upgrade
        ;;
    2)
        echo "Actualizando Fedora..."
        sudo dnf -y upgrade
        ;;
    3)
        echo "Actualizando openSUSE..."
        sudo zypper refresh && sudo zypper update -y
        ;;
    *)
        echo "Opción no válida o sistema no soportado por este script."
        ;;
esac

echo ""
echo "Terminado. Tu sistema ya se encuentra actualizado."
