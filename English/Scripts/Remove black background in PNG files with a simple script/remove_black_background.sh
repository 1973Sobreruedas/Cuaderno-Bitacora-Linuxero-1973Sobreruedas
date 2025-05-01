#!/bin/bash

# Script to convert black background to transparency in all PNG files in the current directory
# Requires ImageMagick

echo "🧽 Starting black background cleaning process..."

# Check if the destination folder already exists
if [ -d "transparent" ]; then
    echo "⚠️ The folder 'transparent' already exists. Please delete or rename it before continuing."
    exit 1
fi

mkdir transparent

for img in *.png; do
    echo "🖼️ Processing: $img"
    convert "$img" -fuzz 10% -transparent "#000000" "transparent/$img"
done

echo "✅ Process completed. Check the ./transparent folder"
