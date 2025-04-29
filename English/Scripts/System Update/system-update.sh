#!/bin/bash

# by 1973Sobreruedas - Project on GitHub -> https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas
# Interactive system updater script
# Compatible with Debian/Ubuntu/Mint, Fedora, and openSUSE.

echo "======================================"
echo "     LINUX SYSTEM UPDATER TOOL        "
echo "======================================"
echo ""
echo "Select your distribution:"
echo "1. Debian and derivatives (Linux Mint, Ubuntu)"
echo "2. Fedora"
echo "3. openSUSE"
echo ""
read -p "Enter the corresponding number and press [ENTER]: " option

case $opcion in
    1)
        echo "Updating Debian/Ubuntu/Mint..."
        sudo apt-get update && sudo apt-get -y upgrade
        ;;
    2)
        echo "Updating Fedora..."
        sudo dnf -y upgrade
        ;;
    3)
        echo "Updating openSUSE..."
        sudo zypper refresh && sudo zypper update -y
        ;;
    *)
        echo "Invalid option or unsupported system."
        ;;
esac

echo ""
echo "Done. Your system is now up to date."
