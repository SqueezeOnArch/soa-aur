#!/bin/bash

app=$1

if [ ! -d "$app" ]; then
    echo "Usage soa-update <directory>"
    exit
fi

# PKGBUILD files using git source get modified - checkout again
git checkout jivelite/PKGBUILD
git checkout soa-web/PKGBUILD
git checkout squeezelite/PKGBUILD

git pull

cd $app
makepkg --asroot -c -i -f -s --noconfirm
cd ..

