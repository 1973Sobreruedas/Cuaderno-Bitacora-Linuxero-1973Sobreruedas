#!/bin/bash

# 🐧 MSL / 🐙 CBL – Script actualizador de sistemas Linux interactivo
# 
# Autor: @1973Sobreruedas
# Proyecto en GitHub: https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas (Español)
# Proyecto en Internet: https://manualdesupervivenciaLinux.com (Español)
# 
# Compatible con:
#   • Linux Mint MATE (base principal)
#   • Debian y derivados (Ubuntu, etc.)
#   • Fedora
#   • OpenSUSE
#           
# Escritorios compatibles:
#   • MATE
#   • GNOME
#   • Cinnammon
#   • XFCE
#   • LXQt
#   • KDE / Plasma
#   
# Supervisado y testado con ChatGPT (OpenAI)
# Licencia: CC BY-NC-SA 4.0 – Compartir igual, sin uso comercial y con atribución.
# Versión 1.2 – 10/10/2025

# Variables
blanco_neg="\e[1;37m"
blanco_claro="\e[0;97m"
rojo="\e[0;31m"
negro="\e[0;30m"
azul="\e[0;34m"
cian="\e[0;36m"
cian_neg="\e[1;36m"
verde="\e[0;32m"
verde_neg_inv="\e[7;1;32m"
verde_claro="\e[0;92m"
amarillo="\e[0;33m"
amarillo_neg="\e[1;33m"
color_reset="\e[0m"
VERSION_LOCAL="1.2"
VERSION_REPO=$(curl -s --max-time 3 https://raw.githubusercontent.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas/main/Cuaderno_Bitacora/Scripts/Actualizador_sistemas/VERSION | head -n1 || echo "Sin respuesta del repositorio...")

# Funciones
fin_bien() {
    echo -e "\n ✅ ${verde}Terminado. Tu sistema ya se encuentra actualizado.${color_reset}\n\n"
    exit 0
}
fin_mal() {
    echo -e "\n ❌ ${rojo}Algo falló...\n\n Te aconsejo que verifiques manualmente dónde se encuentra tu error...${color_reset}\n"
    exit 1;
}

# Menú
clear
echo -e "${verde_claro}╔═════════════════════════════════════════════════════════════════════════════╗"
echo -e "╟─────────────────────────────────────────────────────────────────────────────╢"
echo -e "║         ${verde_neg_inv}A C T U A L I Z A D O R   D E   S I S T E M A S   L I N U X         ${verde_claro}║"
echo -e "╟─────────────────────────────────────────────────────────────────────────────╢"
echo -e "║                     ${blanco_neg}Web - Manual de Supervivencia Linux                     ${verde_claro}║"
echo -e "║                   ${blanco_claro}https://manualdesupervivencialinux.com                    ${verde_claro}║"
echo -e "║                                                                             ║"
echo -e "║                  ${blanco_neg}GitHub - El Cuaderno de Bitácora Linuxero                  ${verde_claro}║"
echo -e "║${blanco_claro}https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas${verde_claro}║"
echo -e "║                                                                             ║"
echo -e "╟─────────────────────────────────────────────────────────────────────────────╢"
echo -e "║                       ${verde}▓ ▒ ░ 10 de octubre de 2025 ░ ▒ ▓                     ${verde_claro}║"
echo -e "╠═════════════════════════════════════════════════════════════════════════════╝"
echo -e "╟─────────────────────────────────────────────────────────────────────────────╖"
echo -e "║ 📦 ${amarillo}Versión local: ${amarillo_neg}${VERSION_LOCAL}   ${verde_claro}|   🌐 ${blanco_claro}Última versión repositorio: ${blanco_neg}$VERSION_REPO${verde_claro}"
echo -e "╟─────────────────────────────────────────────────────────────────────────────╜"
echo -e "╟─────────────────────────────────────────────────────────────────────────────┐"
echo -e "╟ ${verde}Escoja una opción para actualizar su sistema ${negro}(repositorios y programas)${color_reset}"
echo -e "╟${gris}1. 🗑️ ${azul} Debian y derivados (Linux Mint, Ubuntu, etc.)${verde}"
echo -e "╟${gris}2. 🧹 ${azul}Fedora${verde}"
echo -e "╟${gris}3. 🧼 ${azul}openSUSE${verde}"
echo -e "╟${gris}4. 👋 ${azul}Salir${verde}"
echo -e "║"
read -p "╙Escoge una opción: " opcion_usuario

# Menú opciones
case $opcion_usuario in
    1)
        echo -e "\n ${amarillo}Actualizando sistema Debian / Ubuntu /Linux Mint o derivados...\n${cian}"
        sudo apt-get update && sudo apt-get -y upgrade && fin_bien || fin_mal
        exit 0
        ;;
    
    2)
        echo -e "\n ${amarillo}Actualizando Fedora...\n${cian}"
        sudo dnf -y upgrade && fin_bien || fin_mal
        exit 0
        ;;
    
    3)
        echo -e "\n ${amarillo}Actualizando openSUSE...\n${cian}"
        sudo zypper refresh && sudo zypper update -y && fin_bien || fin_mal
        exit 0
        ;;      
        
    4)
        echo -e "\n ${cian_neg}Saliendo...\n\n${color_reset}"
        exit 0
        ;;
    *)
        echo -e "\n ${rojo}❌Opción no válida o sistema no soportado por este script.\n\n${color_reset}"
        exit 1
        ;;
esac
