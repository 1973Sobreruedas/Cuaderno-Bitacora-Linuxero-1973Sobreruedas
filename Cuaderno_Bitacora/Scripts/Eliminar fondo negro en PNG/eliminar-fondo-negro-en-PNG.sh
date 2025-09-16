#!/bin/bash

# Script para convertir fondo negro a transparencia en todos los PNG de la carpeta actual
# Requiere ImageMagick
# por 1973Sobreruedas
# Proyecto en GitHub: https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas
# Proyecto en Internet: https://manualdesupervivenciaLinux.com          
# Compatible con Debian, Ubuntu, Linux Mint y derivados.
# Supervisado y testado con ChatGPT (OpenAI)
# Licencia: CC BY-NC-SA 4.0 - Compartir igual, sin uso comercial y con atribución.
# Versión 1.1

# Variables
selec_gris_parpadeo="\e[90;5m"
selec_gris="\e[1;30m"
selec_gris_claro="\e[0;37m"
selec_azul="\e[34m"
selec_azul_claro1="\e[0;36m"
selec_azul_claro2="\e[1;36m"
selec_verde="\e[32m"
selec_rojo="\e[31m"
selec_amarillo="\e[33m"
selec_reset="\e[0m"
VERSION_LOCAL="1.1"
CONVERSION="PNG con transparencia"

# Menú
clear
echo -e "${selec_azul}==============================================================================="
echo "=-----------------------------------------------------------------------------="
echo "=            C R E A R   T R A N S P A R E N C I A S   E N   P N G            ="
echo "=                      C O N   F O N D O S   N E G R O S                      ="
echo "=-----------------------------------------------------------------------------="
echo "=                     Web - Manual de Supervivencia Linux                     ="
echo "=                   https://manualdesupervivencialinux.com                    ="
echo "=                                                                             ="
echo "=                  GitHub - El Cuaderno de Bitácora Linuxero                  ="
echo "=https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas="
echo "=-----------------------------------------------------------------------------="
echo "=                          16 de septiembre de 2025                           ="
echo "==============================================================================="
echo ""
echo -e " 📦 ${selec_amarillo}Versión local:${selec_verde} $VERSION_LOCAL${selec_reset}"
echo ""

# Menú opciones
echo -e ${selec_azul_claro2}" S e l e c c i o n e   u n a   o p c i ó n :"
echo -e "==============================================================================="${selec_reset}
echo ""
echo -e " ${selec_azul_claro2}1. ${selec_azul}Convertir todos los PNG del directorio${selec_reset}"
echo -e " ${selec_azul_claro2}2. ${selec_azul}Comprobar actualización disponible${selec_reset}"
echo -e " ${selec_azul_claro2}3. ${selec_azul}Salir${selec_reset}"
echo ""
read -p " Ingrese el número correspondiente y pulse [ENTER]: " opcion

case $opcion in
    1)
        echo -e "\n 🧽 Iniciando proceso de limpieza de fondos negros...\n"
        echo -e "\n Tus archivos originales no serán modificados.\n"
      
        # Verifica si la carpeta ya existe
        if [ -d "$CONVERSION" ]; then
            echo -e " ⚠️ La carpeta ${selec_rojo}'$CONVERSION'${selec_reset} ya existe.\n Elimina, mueve o renombra antes de continuar.\n\n Saliendo...\n\n"
            exit 1
        fi
        
        mkdir -p "$CONVERSION"
        
        for img in *.png; do
            echo " 🖼️ Procesando: $img"
            convert "$img" -fuzz 10% -transparent "#000000" "$CONVERSION/$img"
        done
        
        echo -e "\n ✅ Proceso completado. Revisa la carpeta $CONVERSION.\n\n"
        exit 0
        ;;
    2)
        echo -e "${selec_gris}\n Comprobando en el repositorio si hay una actualización disponible...${selec_reset}"
        # Chequear versión
        check_version() {
            VERSION_REPO=$(curl -s https://raw.githubusercontent.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas/main/Cuaderno_Bitacora/Scripts/Eliminar%20fondo%20negro%20en%20PNG/VERSION | head -n1)
            
            echo -e "\n 🌐 ${selec_amarillo}Última versión publicada:${selec_rojo} $VERSION_REPO ${selec_reset}"
            
        if [[ "$VERSION_LOCAL" != "$VERSION_REPO" ]]; then
            echo -e "\n ⚠️  ${selec_azul_claro2}¡Hay una nueva versión disponible!"
            echo -e "\n   🔗    🇪🇸 Repositorio en español:"
            echo -e "\n Visita:\n"
            echo -e "   🔗 ${selec_gris}https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas/tree/main/Cuaderno_Bitacora/Scripts/Eliminar%20fondo%20negro%20en%20PNG${selec_reset}\n\n\n"
        else
            echo -e "\n ${selec_verde}✅ Estás usando la última versión disponible.${selec_reset}\n\n\n"
        fi
        }
        
        check_version
        exit 0
        ;;
    3)
        echo -e "\n ${selec_azul_claro2}Saliendo...\n\n${selec_reset}"
        exit 0
        ;;
    *)
        echo -e "\n ${selec_rojo}Opción no válida o sistema no soportado por este script.\n${selec_reset}"
        exit 1
        ;;
esac
