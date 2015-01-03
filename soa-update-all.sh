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
git checkout HEAD -- $(git ls-files -m)
git pull

sudo pacman -Syu --noconfirm

if [[ ! -f ../binary-repo ]]; then

	if [[ `pacman -Qq turbolua 2>/dev/null` == "turbolua" ]]; then
		cd turbolua
		makepkg -c -i -s --noconfirm --noprogressbar "$opt"
		cd ..
	fi
	
	if [[ `pacman -Qq libsoxr 2>/dev/null` == "libsoxr" ]]; then
		cd libsoxr
		makepkg -c -i -s --noconfirm --noprogressbar "$opt"
		cd ..
	fi
	
	if [[ `pacman -Qq squeezelite 2>/dev/null` == "squeezelite" ]]; then
		cd squeezelite
		makepkg -c -i -s --noconfirm --noprogressbar "$opt"
		cd ..
	fi
	
	if [[ `pacman -Qq jivelite 2>/dev/null` == "jivelite" ]]; then
		cd jivelite
		makepkg -c -i -s --noconfirm --noprogressbar "$opt"
		cd ..
	fi
	
	if [[ `pacman -Qq jivelite-autologin 2>/dev/null` == "jivelite-autologin" ]]; then
		cd jivelite-autologin
		makepkg -c -i -s --noconfirm --noprogressbar "$opt"
		cd ..
	fi
	
	if [[ `pacman -Qq logitechmediaserver 2>/dev/null` == "logitechmediaserver" ]]; then
		cd logitechmediaserver-7.8
		makepkg -c -i -s --noconfirm --noprogressbar "$opt"
		cd ..
	fi

fi

if [[ `pacman -Qq logitechmediaserver-cpan 2>/dev/null` == "logitechmediaserver-cpan" ]]; then
    cd logitechmediaserver-7.9-cpan
    makepkg -c -i -s --noconfirm --noprogressbar "$opt"
    cd ..
fi

if [[ `pacman -Qq logitechmediaserver-lms 2>/dev/null` == "logitechmediaserver-lms" ]]; then
    cd logitechmediaserver-7.9-lms
    makepkg -c -i -s --noconfirm --noprogressbar "$opt"
    cd ..
fi

# custom kernels
if [[ `pacman -Qq linux-wandboard-soa 2>/dev/null` == "linux-wandboard-soa" ]]; then
    cd linux-wandboard
    makepkg -c -i -s --noconfirm --noprogressbar "$opt"
    cd ..
fi

if [[ `pacman -Qq linux-sun7i-soa 2>/dev/null` == "linux-sun7i-soa" ]]; then
    cd linux-sun7i
    makepkg -c -i -s --noconfirm --noprogressbar "$opt"
    cd ..
fi

if [[ ! -f ../binary-repo ]]; then

	# update soa-web last as restarting the web interface can kill this script
	if [[ `pacman -Qq soa-web 2>/dev/null` == "soa-web" ]]; then
		cd soa-web
		makepkg -c -i -s --noconfirm --noprogressbar "$opt"
		cd ..
	fi

fi

popd > /dev/null

echo
echo Update complete: `date`
