#!/bin/bash

if [ "$1" == "-f" ]; then
    opt="-f"
else
    opt="--needed"
fi

# PKGBUILD files using git source get modified - checkout again
git pull
git checkout HEAD -- $(git ls-files -m)

cd turbolua
makepkg --asroot -c -i -s --noconfirm "$opt"
cd ..

cd soa-web
makepkg --asroot -c -i -s --noconfirm "$opt"
cd ..

cd libsoxr
makepkg --asroot -c -i -s --noconfirm "$opt"
cd ..

cd squeezelite
makepkg --asroot -c -i -s --noconfirm "$opt"
cd ..

cd jivelite
makepkg --asroot -c -i -s --noconfirm "$opt"
cd ..

cd jivelite-autologin
makepkg --asroot -c -i -s --noconfirm "$opt"
cd ..

if [[ `pacman -Qq logitechmediaserver` == "logitechmediaserver" ]]; then
    cd logitechmediaserver-7.8
    makepkg --asroot -c -i -s --noconfirm "$opt"
    cd ..
fi

if [[ `pacman -Qq logitechmediaserver-cpan` == "logitechmediaserver-cpan" ]]; then
    cd logitechmediaserver-7.9-cpan
    makepkg --asroot -c -i -s --noconfirm "$opt"
    cd ..
fi

if [[ `pacman -Qq logitechmediaserver-lms` == "logitechmediaserver-lms" ]]; then
    cd logitechmediaserver-7.9-lms
    makepkg --asroot -c -i -s --noconfirm "$opt"
    cd ..
fi
