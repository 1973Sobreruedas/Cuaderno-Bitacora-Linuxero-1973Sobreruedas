#!/bin/bash

# MSL / CBL - Script de mantenimiento de limpieza
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
# Supervisado y testado con ChatGPT (OpenAI)
# Licencia: CC BY-NC-SA 4.0 - Compartir igual, sin uso comercial y con atribución.
# Versión 1.0 - 05-10-2025

set -euo pipefail
clear

# Variables y funciones
VERSION_LOCAL="1.0"
IDIOMA="es"
blanco_claro="\e[97m"
gris="\e[1;30m"
azul="\e[34m"
azul_claro="\e[0;36m"
cian_claro="\e[96m"
verde="\e[32m"
verde_claro="\e[92m"
rojo="\e[31m"
amarillo="\e[33m"
reset="\e[0m"
    # Ruta de papelera
papelera_info="$HOME/.local/share/Trash/info"
papelera_files="$HOME/.local/share/Trash/files"
papelera_expunged="$HOME/.local/share/Trash/expunged"
papelera_heredada="$HOME/.Trash-$(id -u)"

# Ruta de aché de usuario
cache_usuario="$HOME/.cache"
mensaje_conf="Necesito tu confirmación."
    # Ruta de miniaturas
ruta_miniatura1="$HOME/.cache/thumbnails/fail"
ruta_miniatura2="$HOME/.cache/thumbnails/fail/mate-thumbnail-factory"
ruta_miniatura3="$HOME/.cache/thumbnails/large"
ruta_miniatura4="$HOME/.cache/thumbnails/normal"
ruta_miniatura5="$HOME/.cache/thumbnails/x-large"
ruta_miniatura6="$HOME/.cache/thumbnails/xx-large"
    # Patrón para seleccionar los archivos a eliminar
patron_archivos="*.png"

menu_version() {
  local version="$1"
  local ancho=80
  local texto="📦 ${amarillo}Versión local:${verde} $version${reset}"
  local longitud_texto_real=$(echo -e "$texto" | sed 's/\x1B\[[0-9;]*[a-zA-Z]//g' | wc -c)
  local espacios=$((ancho - longitud_texto_real))
  local relleno=$(printf '%*s' "$espacios")
  echo "╟─────────────────────────────────────────────────────────────────────────────╖"
  echo -e "║ $texto$relleno${verde_claro}║"
  echo "╟─────────────────────────────────────────────────────────────────────────────╜"
}
salida_positiva_papelera() {
    echo -e "   🟢 ${verde}Tu papelera ha sido vaciada.${reset}"
    exit 0
}
salida_negativa_papelera() {
    echo -e "   📛 ${rojo}No he podido vaciar tu papelera.${reset}"
    exit 1
}
salida_positiva_pap_vieja() {
    echo -e "   🟢 ${verde}Tus papeleras obsoletas han sido eliminadas.${reset}"
    exit 0
}
salida_negativa_pap_vieja() {
    echo -e "   📛 ${rojo}No tenías papeleras en desuso. No se borra nada.${reset}"
    exit 1
}
salida_positiva_cache_us() {
    echo -e "   🟢 ${verde}Tu caché de usuario está vacía.${reset}"
    exit 0
}
salida_negativa_cache_us() {
    echo -e "   📛 ${rojo}No he podido vaciar tu caché de usuario.${reset}"
    exit 1
}
salida_positiva_miniatura() {
    echo -e "   🟢 ${verde}Tus miniaturas han sido borradas.${reset}"
    exit 0
}
salida_negativa_miniatura() {
    echo -e "   📛 ${rojo}No he podido borrar tus miniaturas.${reset}"
    exit 1
}
vaciar_papelera() {
    echo -e "   🟡 ${amarillo}Vaciando la papelera del usuario...${reset}"
    # Se incluye en el borrado archivos y carpetas ocultas en el patrón *
    shopt -s dotglob nullglob
    rm -rf -- ~/.local/share/Trash/files/* ~/.local/share/Trash/info/*
    shopt -u dotglob nullglob
    salida_positiva_papelera
}
limpiar_carpeta() {
    local ruta_miniatura="$1"
    if [ ! -d "$ruta_miniatura" ]; then
        echo "Carpeta $ruta_miniatura no existe, se omite el borrado."
        return 0
    fi
    
    echo -e "Limpiando la carpeta: $ruta_miniatura\n"
    sleep 1s
        # Bucle para eliminar las miniaturas con el patrón propuesto
    find "$ruta_miniatura" -type f -name "$patron_archivos" -print0 | while read -d $'\0' archivo
    do
		rm -rf -- "$archivo" 2>/dev/null
    done
    echo "Carpeta $ruta_miniatura limpiada."
}
    # === Bloque multi-distro / multi-disco para papeleras obsoletas ===
limpiar_papeleras_externas() {
    local uid
    uid=$(id -u)
        # Directorios de montajes típicos
    local bases=("/media/$USER" "/run/media/$USER")
   for base in "${bases[@]}"; do
        [ -d "$base" ] || continue
        for punto in "$base"/*; do
            [ -d "$punto" ] || continue

            # Busca formatos de papelera obsoletos o actuales
            for papelera_directorio in ".Trash" ".Trash-$uid" ".local/share/Trash"; do
                if [ -d "$punto/$papelera_directorio" ]; then
                    echo "🗑️  Limpiando papelera en: $punto/$papelera_directorio"
                    rm -rf -- "$punto/$papelera_directorio"/* 2>/dev/null || true
                fi
            done 
        done
    done
}

# Menú
echo -e "${verde_claro}╔═════════════════════════════════════════════════════════════════════════════╗"
echo -e "╟─────────────────────────────────────────────────────────────────────────────╢"
echo -e "║              ${verde_claro}M A N T E N I M I E N T O   D E   L I M P I E Z A              ║"
echo -e "╟─────────────────────────────────────────────────────────────────────────────╢"
echo -e "║                     ${blanco_claro}Web - Manual de Supervivencia Linux                     ${verde_claro}║"
echo -e "║                   ${blanco_claro}https://manualdesupervivencialinux.com                    ${verde_claro}║"
echo -e "║                                                                             ║"
echo -e "║                  ${blanco_claro}GitHub - El Cuaderno de Bitácora Linuxero                  ${verde_claro}║"
echo -e "║${blanco_claro}https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas${verde_claro}║"
echo -e "║                                                                             ║"
echo -e "╟─────────────────────────────────────────────────────────────────────────────╢"
echo -e "║                     ${verde}▓ ▒ ░ 17 de septiembre de 2025 ░ ▒ ▓                    ${verde_claro}║"
echo -e "╠═════════════════════════════════════════════════════════════════════════════╝"
menu_version "$VERSION_LOCAL"
echo -e "╟─────────────────────────────────────────────────────────────────────────────┐"
echo -e "╟${gris}1. 🗑️ ${azul}Vaciar la papelera${verde}"
echo -e "╟${gris}2. 🧹 ${azul}Buscar y eliminar papeleras obsoletas de sistemas antiguos${verde}"
echo -e "╟${gris}3. 🧼 ${azul}Limpiar caché de usuario${verde}"
echo -e "╟${gris}4. 🧽 ${azul}Borrar miniaturas (thumbnails)${verde}"
echo -e "╟${gris}5. 👋 ${azul}Salir${verde}"
echo -e "║"
read -p "╙Escoge una opción: " opcion_usuario

case $opcion_usuario in
    1)
        echo $mensaje_conf
        read -p "\n  ⚠️ ¿Estás seguro que deseas vaciar la papelera? (s/n): " confirmacion
        if [[ $confirmacion =~ ^([sS]|([sS][iI])|([sS][íÍ]))$ ]]; then
            vaciar_papelera
            salida_positiva_papelera
        else
            salida_negativa_papelera
        fi
        ;;
   2)
        echo $mensaje_conf
        read -p "\n  ⚠️ ¿Quieres buscar papeleras en desuso y eliminarlas? (s/n): " confirmacion
        if [[ $confirmacion =~ ^([sS]|([sS][iI])|([sS][íÍ]))$ ]]; then
            # Limpiar papelera del usuario
            if [ -d "$papelera_heredada" ]; then
                rm -rf -- "$papelera_heredada"/* 2>/dev/null || true
                salida_positiva_pap_vieja
            else
                # Limpiar papeleras en discos externos / particiones montadas
                limpiar_papeleras_externas
                salida_positiva_pap_vieja
            fi
        else
            salida_negativa_pap_vieja
        fi
        ;;
    3)
        echo $mensaje_conf
        read -p "\n  ⚠️ ¿Estás seguro que deseas vaciar la caché de usuario? Sí / No " confirmacion
        if [[ $confirmacion =~ ^([sS]|([sS][iI])|([sS][íÍ]))$ ]]; then
            rm -rf -- "$cache_usuario"/*
            salida_positiva_cache_us
        else
            salida_negativa_cache_us
        fi
        ;;
    4)
        echo $mensaje_conf
        read -p "\n  ⚠️ ¿Estás seguro que deseas eliminar tus miniaturas (thumbnails)? Sí / No " confirmacion
        if [[ $confirmacion =~ ^([sS]|([sS][iI])|([sS][íÍ]))$ ]]; then
            for ruta in "$ruta_miniatura1" "$ruta_miniatura2" "$ruta_miniatura3" \
            "$ruta_miniatura4" "$ruta_miniatura5" "$ruta_miniatura6"; do
                limpiar_carpeta "$ruta"
            done
            echo -e "\n\n   🟢 ${verde}Proceso completado.${reset}"
            salida_positiva_miniatura
        else
            salida_negativa_miniatura
        fi
        ;;
    5)
        echo -e "\n   🌱 ${amarillo}No se borra nada...\n\n   Saliendo...\n\n${reset}"
        exit 0
        ;;
    *)
        echo -e "\n   ❌ ${rojo}Opción no válida.${reset}\n"
        exit 1
        ;;
esac
