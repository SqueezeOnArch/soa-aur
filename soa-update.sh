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
git pull
git checkout HEAD -- $(git ls-files -m)

cd $app
makepkg --asroot -c -i "$force" -s --noconfirm
cd ..

