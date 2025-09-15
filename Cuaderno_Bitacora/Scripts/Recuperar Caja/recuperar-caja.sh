#!/bin/bash

# Script de recuperación de Caja ante ejecuciones «zombificado» o mal funcionamiento.
# por 1973Sobreruedas
# Proyecto en GitHub: https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas
# Proyecto en Internet: https://manualdesupervivenciaLinux.com          
# Compatible con Debian, Ubuntu, Linux Mint, Fedora y OpenSUSE.
# Supervisado y testado con ChatGPT (OpenAI)
# Licencia: CC BY-NC-SA 4.0 - Compartir igual, sin uso comercial y con atribución.
# Versión 1.0

echo "========================================"
echo "=         RECUPERADOR DE CAJA          ="
echo "=                                      ="
echo "=    Manual de Supervivencia Linux     ="
echo "=                  ·                   ="
echo "=   El Cuaderno de Bitácora Linuxero   ="
echo "=                                      ="
echo "=          2025 - Versión 1.0          ="
echo "========================================"
echo ""
echo "Seleccione el modo de recuperación:"
echo "1. Errores generales"
echo "2. Problemas con «gvfs»"
echo "3. Salir"
echo ""
read -p "Ingrese el número correspondiente y pulse [ENTER]: " opcion

case $opcion in
    1)
        echo "Enterrando a Caja ⚰️ ..."
        killall -9 caja 2>/dev/null
        rm -rf ~/.cache/caja ~/.cache/mate
        sleep 2
        caja --force-desktop &
        echo "⚡ Caja ha vuelto del más allá por causas menores."
        exit 0
        ;;
    2)
        echo "Enterrando al demonio gvfs 👿 ..."
        killall -9 caja gvfsd gvfsd-fuse gvfsd-metadata gvfsd-trash gvfsd-network 2>/dev/null
        sleep 2
        caja --force-desktop &
        echo "🔥 Caja y gvfs han sido exorcizados. Reencarnación completada."
        exit 0
        ;;
    3)  echo "Saliendo sin arreglar nada."
        exit 0
        ;;
    *)
        echo "Opción no válida, no soportado por este script."
        exit 1
        ;;
esac

echo ""
echo -e "👻 En caso de que estos exorcismos no funcionen te animo a que me lo comuniques a través de:\n \nhttps://manualdesupervivencialinux.com/contacto/\n\nDéjame toda la información necesaria para actualizar este script, gracias. 😀"
