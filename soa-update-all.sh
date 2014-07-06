#!/bin/bash

if [ "$1" == "-f" ]; then
    opt="-f"
else
    opt="--needed"
fi

# PKGBUILD files using git source get modified - checkout again
git pull
git checkout HEAD -- $(git ls-files -m)

if [[ `pacman -Qq turbolua` == "turbolua" ]]; then
	cd turbolua
	makepkg --asroot -c -i -s --noconfirm --noprogressbar "$opt"
	cd ..
fi

if [[ `pacman -Qq soa-web` == "soa-web" ]]; then
	cd soa-web
	makepkg --asroot -c -i -s --noconfirm --noprogressbar "$opt"
	cd ..
fi

if [[ `pacman -Qq libsoxr` == "libsoxr" ]]; then
	cd libsoxr
	makepkg --asroot -c -i -s --noconfirm --noprogressbar "$opt"
	cd ..
fi

if [[ `pacman -Qq squeezelite` == "squeezelite" ]]; then
	cd squeezelite
	makepkg --asroot -c -i -s --noconfirm --noprogressbar "$opt"
	cd ..
fi

if [[ `pacman -Qq jivelite` == "jivelite" ]]; then
	cd jivelite
	makepkg --asroot -c -i -s --noconfirm --noprogressbar "$opt"
	cd ..
fi

if [[ `pacman -Qq jivelite-autologin` == "jivelite-autologin" ]]; then
	cd jivelite-autologin
	makepkg --asroot -c -i -s --noconfirm --noprogressbar "$opt"
	cd ..
fi

if [[ `pacman -Qq logitechmediaserver` == "logitechmediaserver" ]]; then
    cd logitechmediaserver-7.8
    makepkg --asroot -c -i -s --noconfirm --noprogressbar "$opt"
    cd ..
fi

if [[ `pacman -Qq logitechmediaserver-cpan` == "logitechmediaserver-cpan" ]]; then
    cd logitechmediaserver-7.9-cpan
    makepkg --asroot -c -i -s --noconfirm --noprogressbar "$opt"
    cd ..
fi

if [[ `pacman -Qq logitechmediaserver-lms` == "logitechmediaserver-lms" ]]; then
    cd logitechmediaserver-7.9-lms
    makepkg --asroot -c -i -s --noconfirm --noprogressbar "$opt"
    cd ..
fi
