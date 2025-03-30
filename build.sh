#!/usr/bin/env bash

# Change context to script directory.
cd "$(dirname "$0")"

# Clear the output directory.
rm -r out; mkdir out
echo "Cleared output directory."

# Build the fancymenu .fma first.
(cd fancymenu && zip -r ../out/main_menu.fma frames metadata.json)

# Return to script directory.
cd "$(dirname "$0")"

# Move the fma to the assets path
mv out/main_menu.fma assets/createadvancedindustries/textures/gui

# Get the version number.
if [[ -z $1 ]]; then
  VERSION=$(git describe --tags --abbrev=0)
else
  VERSION=$1
fi

# Build the resource pack.
zip -q -r "out/create-advanced-industries-main-menu-${VERSION}.zip" assets pack.mcmeta pack.png
