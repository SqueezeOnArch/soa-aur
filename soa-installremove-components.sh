#!/bin/bash

if [[ "$#" == "0" ]]; then
	echo "Usage: soa-installremove-componets.sh <install|remove> <component1> <install|remove> <component2>"
	exit 1
fi

echo Install / Remove Components started: `date`
echo 

pushd `dirname $0` > /dev/null

# PKGBUILD files using git source get modified - checkout again
echo sychronising scripts
git checkout HEAD -- $(git ls-files -m)
git pull

while (( "$#" )); do

	action=$1
	component=$2
	shift 2
    
	if [[ "$component" == "squeezelite" ]]; then
		if [[ "$action" == "remove" ]]; then
			pacman -R --noconfirm squeezelite libsoxr
		fi
		if [[ "$action" == "install" ]]; then
			cd libsoxr
			makepkg --asroot -c -i -f -s --noconfirm
			cd ..
			cd squeezelite
			makepkg --asroot -c -i -f -s --noconfirm
			cd ..
		fi
	fi
	
	if [[ "$component" == "jivelite" ]]; then
		if [[ "$action" == "remove" ]]; then
			pacman -R --noconfirm jivelite-autologin jivelite
		fi
		if [[ "$action" == "install" ]]; then
			cd jivelite
			makepkg --asroot -c -i -f -s --noconfirm
			cd ..
			cd jivelite-autologin
			makepkg --asroot -c -i -f -s --noconfirm
			cd ..
		fi
	fi
	
	if [[ "$component" == "server78" ]]; then
		if [[ "$action" == "remove" ]]; then
			pacman -R --noconfirm logitechmediaserver
		fi
		if [[ "$action" == "install" ]]; then
			cd logitechmediaserver-7.8
			makepkg --asroot -c -i -s --noconfirm
			cd ..
		fi
	fi
	
	if [[ "$component" == "server79" ]]; then
		if [[ "$action" == "remove" ]]; then
			pacman -R --noconfirm logitechmediaserver-lms logitechmediaserver-cpan
		fi
		if [[ "$action" == "install" ]]; then
			cd logitechmediaserver-7.9-cpan
			makepkg --asroot -c -i -s --noconfirm
			cd ..
			cd logitechmediaserver-7.9-lms
			makepkg --asroot -c -i -s --noconfirm
			cd ..
		fi
	fi
	
	if [[ "$component" == "linux-wandboard-soa" ]]; then
		if [[ "$action" == "remove" ]]; then
			pacman -R --noconfirm linux-wandboard-soa
			pacman -S --noconfirm linux-wandboard
		fi
		if [[ "$action" == "install" ]]; then
			cd linux-wandboard
			makepkg --asroot -c -s --noconfirm
			echo -e "y\ny\n" | makepkg --asroot -c -s -i
			cd ..
		fi
	fi

	if [[ "$component" == "linux-sun7i-soa" ]]; then
		if [[ "$action" == "remove" ]]; then
			pacman -R --noconfirm linux-sun7i-soa
			pacman -S --noconfirm linux-sun7i
		fi
		if [[ "$action" == "install" ]]; then
			cd linux-sun7i
			makepkg --asroot -c -s --noconfirm
			echo -e "y\ny\n" | makepkg --asroot -c -s -i
			cd ..
		fi
	fi

done

popd > /dev/null

echo
echo Install / Remove Components complete: `date`
