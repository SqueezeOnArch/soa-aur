#!/bin/bash

app=$1

if [ ! -d "$app" ]; then
    echo "Usage soa-update <directory>"
    exit
fi

git commit -a -m "!" -uno
git pull

cd $app
makepkg --asroot -c -i -s --noconfirm
cd ..

