#!/bin/bash

echo Update started: `date`
echo

pushd `dirname $0` > /dev/null

if [ "$1" == "-f" ]; then
    opt="-f"
else
    opt="--needed"
fi

# PKGBUILD files using git source get modified - checkout again
echo synchronising scripts
git pull
git checkout HEAD -- $(git ls-files -m)

if [[ `pacman -Qq turbolua 2>/dev/null` == "turbolua" ]]; then
	cd turbolua
	makepkg --asroot -c -i -s --noconfirm --noprogressbar "$opt"
	cd ..
fi

if [[ `pacman -Qq soa-web 2>/dev/null` == "soa-web" ]]; then
	cd soa-web
	makepkg --asroot -c -i -s --noconfirm --noprogressbar "$opt"
	cd ..
fi

if [[ `pacman -Qq libsoxr 2>/dev/null` == "libsoxr" ]]; then
	cd libsoxr
	makepkg --asroot -c -i -s --noconfirm --noprogressbar "$opt"
	cd ..
fi

if [[ `pacman -Qq squeezelite 2>/dev/null` == "squeezelite" ]]; then
	cd squeezelite
	makepkg --asroot -c -i -s --noconfirm --noprogressbar "$opt"
	cd ..
fi

if [[ `pacman -Qq jivelite 2>/dev/null` == "jivelite" ]]; then
	cd jivelite
	makepkg --asroot -c -i -s --noconfirm --noprogressbar "$opt"
	cd ..
fi

if [[ `pacman -Qq jivelite-autologin 2>/dev/null` == "jivelite-autologin" ]]; then
	cd jivelite-autologin
	makepkg --asroot -c -i -s --noconfirm --noprogressbar "$opt"
	cd ..
fi

if [[ `pacman -Qq logitechmediaserver 2>/dev/null` == "logitechmediaserver" ]]; then
    cd logitechmediaserver-7.8
    makepkg --asroot -c -i -s --noconfirm --noprogressbar "$opt"
    cd ..
fi

if [[ `pacman -Qq logitechmediaserver-cpan 2>/dev/null` == "logitechmediaserver-cpan" ]]; then
    cd logitechmediaserver-7.9-cpan
    makepkg --asroot -c -i -s --noconfirm --noprogressbar "$opt"
    cd ..
fi

if [[ `pacman -Qq logitechmediaserver-lms 2>/dev/null` == "logitechmediaserver-lms" ]]; then
    cd logitechmediaserver-7.9-lms
    makepkg --asroot -c -i -s --noconfirm --noprogressbar "$opt"
    cd ..
fi

popd > /dev/null

echo
echo Update complete: `date`
