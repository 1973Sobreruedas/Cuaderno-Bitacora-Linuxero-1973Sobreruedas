#!/bin/bash

# Script actualizador de sistemas Linux interactivo
# por 1973Sobreruedas
# Proyecto en GitHub: https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas
# Proyecto en Internet: https://manualdesupervivenciaLinux.com          
# Compatible con Debian, Ubuntu, Linux Mint, Fedora y OpenSUSE.
# Supervisado y testado con ChatGPT (OpenAI)
# Licencia: CC BY-NC-SA 4.0 - Compartir igual, sin uso comercial y con atribución.
# Versión 1.1

# Variables
selec_gris='\e[90;5m'
selec_verde='\e[32m'
selec_rojo='\e[31m'
selec_amarillo='\e[33m'
selec_reset='\e[0m'
LOGS_DIR="logs"
VERSION_LOCAL="1.1"

# Menú
echo "==============================================================================="
echo "=-----------------------------------------------------------------------------="
echo "=         A C T U A L I Z A D O R   D E   S I S T E M A S   L I N U X         ="
echo "=-----------------------------------------------------------------------------="
echo "=                     Web - Manual de Supervivencia Linux                     ="
echo "=                   https://manualdesupervivencialinux.com                    ="
echo "=                                                                             ="
echo "=                  GitHub - El Cuaderno de Bitácora Linuxero                  ="
echo "=https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas="
echo "=                                                                             ="
echo "=-----------------------------------------------------------------------------="
echo "=                          15 de septiembre de 2025                           ="
echo "==============================================================================="
echo ""
echo -e " 📦 ${selec_amarillo}Versión local:${selec_verde} $VERSION_LOCAL${selec_reset}"
echo ""

# Chequear versión
check_version() {
  VERSION_REPO=$(curl -s https://raw.githubusercontent.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas/main/Cuaderno_Bitacora/Scripts/Actualizador%20sistemas/VERSION | head -n1)

  echo -e " 🌐 ${selec_amarillo}Última versión publicada:${selec_rojo} $VERSION_REPO ${selec_reset}"

  if [[ "$VERSION_LOCAL" != "$VERSION_REPO" ]]; then
    echo -e "\n ⚠️  ¡Hay una nueva versión disponible!"
    echo -e "\n   🔗    🇪🇸 Repositorio en español:"
    echo -e "\n Visita:"
    echo -e "   🔗 https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas/tree/main/Cuaderno_Bitacora/Scripts/Actualizador%20sistemas"
  else
    echo -e "\n ✅ Estás usando la última versión disponible.\n "
  fi
}

if [[ "$1" == "--verificar" || "$1" == "--check-version" ]]; then
  check_version
  exit 0
fi

# Menú opciones
echo " S e l e c c i o n e   s u   d i s t r i b u c i ó n :"
echo "==============================================================================="
echo ""
echo " 1. Debian y derivados (Linux Mint, Ubuntu)"
echo " 2. Fedora"
echo " 3. openSUSE"
echo ""
read -p "Ingrese el número correspondiente y pulse [ENTER]: " opcion

case $opcion in
    1)
        echo -e "\nActualizando Debian/Ubuntu/Mint..."
        sudo apt-get update && sudo apt-get -y upgrade
        ;;
    2)
        echo -e "\nActualizando Fedora..."
        sudo dnf -y upgrade
        ;;
    3)
        echo -e "\nActualizando openSUSE..."
        sudo zypper refresh && sudo zypper update -y
        ;;
    *)
        echo -e "\nOpción no válida o sistema no soportado por este script.\n"
        exit 1
        ;;
esac

echo ""
echo " ✅ Terminado. Tu sistema ya se encuentra actualizado."
