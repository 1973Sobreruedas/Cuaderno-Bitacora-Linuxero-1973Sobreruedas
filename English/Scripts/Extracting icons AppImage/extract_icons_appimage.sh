#!/bin/bash

# By 1973Sobreruedas – Project on GitHub -> https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas
# Icon extraction script for AppImage files

# Check if an AppImage file was provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 name-of-the-file.appimage"
    exit 1
fi

# Save the original directory
ORIGINAL_DIR="$PWD"

# Define the AppImage file name and create necessary directories
APPIMAGE="$1"
EXTRACTION_DIR="squashfs-root"
OUTPUT_DIR="ExtractedIcons"  # Directory where all icons will be saved

# Create the output directory in the current directory
mkdir -p "$OUTPUT_DIR"

# Change to the directory where the AppImage file is located
cd "$(dirname "$APPIMAGE")" || exit 1

# Extract the contents of the AppImage
"./$(basename "$APPIMAGE")" --appimage-extract

# Change to the extraction directory
cd "$EXTRACTION_DIR" || exit 1

# Find all icon files and copy them to the output directory
find . -type f \( -name "*.png" -o -name "*.svg" -o -name "*.ico" \) -exec cp {} "$ORIGINAL_DIR/$OUTPUT_DIR/" \;

# Return to the original directory and clean up temporary extraction
cd "$ORIGINAL_DIR"
rm -r "$(dirname "$APPIMAGE")/$EXTRACTION_DIR"

# Check if icons were copied
if [ "$(ls -A "$OUTPUT_DIR")" ]; then
    echo "Icons copied to $OUTPUT_DIR"
else
    echo "No icons found in $APPIMAGE"
fi
