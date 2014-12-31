#!/bin/bash

if [ "$1" == "-f" ]; then
	force=$1
	shift
fi

app=$1

if [ ! -d "$app" ]; then
    echo "Usage soa-update [-f] <directory>"
    exit
fi

# PKGBUILD files using git source get modified - checkout again
git checkout HEAD -- $(git ls-files -m)
git pull

cd $app
makepkg -c -i "$force" -s --noconfirm
cd ..

