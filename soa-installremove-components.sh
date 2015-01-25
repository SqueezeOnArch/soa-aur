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
			sudo pacman -R --noconfirm squeezelite libsoxr
		fi
		if [[ "$action" == "install" ]]; then
			if [[ -f ../binary-repo ]]; then
				sudo pacman -S --noconfirm --noprogressbar squeezelite
			else
				if [[ ! -f /usr/bin/gcc ]]; then
					sudo pacman -S --noconfirm --noprogressbar base-devel
				fi
				cd libsoxr
				makepkg -c -i -f -s --noconfirm --noprogressbar
				cd ..
				cd squeezelite
				makepkg -c -i -f -s --noconfirm --noprogressbar
				cd ..
			fi
		fi
	fi
	
	if [[ "$component" == "jivelite" ]]; then
		if [[ "$action" == "remove" ]]; then
			sudo pacman -R --noconfirm jivelite-autologin jivelite
		fi
		if [[ "$action" == "install" ]]; then
			if [[ -f ../binary-repo ]]; then
				sudo pacman -S --noconfirm --noprogressbar jivelite jivelite-autologin
			else
				if [[ ! -f /usr/bin/gcc ]]; then
					sudo pacman -S --noconfirm --noprogressbar base-devel
				fi
				cd jivelite
				makepkg -c -i -f -s --noconfirm --noprogressbar
				cd ..
				cd jivelite-autologin
				makepkg -c -i -f -s --noconfirm --noprogressbar
				cd ..
			fi
		fi
	fi
	
	if [[ "$component" == "server78" ]]; then
		if [[ "$action" == "remove" ]]; then
			sudo pacman -R --noconfirm logitechmediaserver-7.8-lms logitechmediaserver-7.8-cpan
		fi
		if [[ "$action" == "install" ]]; then
			if [[ -f ../binary-repo ]]; then
				sudo pacman -S --noconfirm --noprogressbar logitechmediaserver-7.8-cpan
				if [[ ! -f /usr/bin/fakeroot ]]; then
					sudo pacman -S --noconfirm --noprogressbar fakeroot
				fi
				cd logitechmediaserver-7.8-lms
				makepkg -c -i -s --noconfirm --noprogressbar
				cd ..
			else
				if [[ ! -f /usr/bin/gcc ]]; then
					sudo pacman -S --noconfirm --noprogressbar base-devel
				fi
				cd logitechmediaserver-7.8-cpan
				makepkg -c -i -s --noconfirm --noprogressbar
				cd ..
				cd logitechmediaserver-7.8-lms
				makepkg -c -i -s --noconfirm --noprogressbar
				cd ..
			fi
		fi
	fi
	
	if [[ "$component" == "server79" ]]; then
		if [[ "$action" == "remove" ]]; then
			sudo pacman -R --noconfirm logitechmediaserver-7.9-lms logitechmediaserver-7.9-cpan
		fi
		if [[ "$action" == "install" ]]; then
			if [[ -f ../binary-repo ]]; then
				sudo pacman -S --noconfirm --noprogressbar logitechmediaserver-7.9-cpan
				if [[ ! -f /usr/bin/fakeroot ]]; then
					sudo pacman -S --noconfirm --noprogressbar fakeroot
				fi
				cd logitechmediaserver-7.9-lms
				makepkg -c -i -s --noconfirm --noprogressbar
				cd ..
			else
				if [[ ! -f /usr/bin/gcc ]]; then
					sudo pacman -S --noconfirm --noprogressbar base-devel
				fi
				cd logitechmediaserver-7.9-cpan
				makepkg -c -i -s --noconfirm --noprogressbar
				cd ..
				cd logitechmediaserver-7.9-lms
				makepkg -c -i -s --noconfirm --noprogressbar
				cd ..
			fi
		fi
	fi
	
	if [[ "$component" == "linux-wandboard-soa" ]]; then
		if [[ "$action" == "remove" ]]; then
			sudo pacman -R --noconfirm linux-wandboard-soa
			sudo pacman -S --noconfirm --noprogressbar linux-wandboard
		fi
		if [[ "$action" == "install" ]]; then
			if [[ ! -f /usr/bin/gcc ]]; then
				sudo pacman -S --noconfirm --noprogressbar base-devel
			fi
			cd linux-wandboard
			makepkg -c -s --noconfirm
			echo -e "y\ny\n" | makepkg -c -s -i --noprogressbar
			cd ..
		fi
	fi

	if [[ "$component" == "linux-sun7i-soa" ]]; then
		if [[ "$action" == "remove" ]]; then
			sudo pacman -R --noconfirm linux-sun7i-soa
			sudo pacman -S --noconfirm --noprogressbar linux-sun7i
		fi
		if [[ "$action" == "install" ]]; then
			if [[ ! -f /usr/bin/gcc ]]; then
				sudo pacman -S --noconfirm --noprogressbar base-devel
			fi
			cd linux-sun7i
			makepkg -c -s --noconfirm
			echo -e "y\ny\n" | makepkg -c -s -i --noprogressbar
			cd ..
		fi
	fi

	if [[ "$component" == "linux-raspberrypi-latest" ]]; then
		if [[ "$action" == "remove" ]]; then
			echo -e "y\ny\n" | sudo pacman -S --noprogressbar linux-raspberrypi
		fi
		if [[ "$action" == "install" ]]; then
			echo -e "y\ny\n" | sudo pacman -S --noprogressbar linux-raspberrypi-latest
		fi
	fi

	if [[ "$component" == "ffmpeg" ]]; then
		if [[ "$action" == "remove" ]]; then
			sudo pacman -R --noconfirm ffmpeg
		fi
		if [[ "$action" == "install" ]]; then
			sudo pacman -S --noconfirm ffmpeg
		fi
	fi

done

popd > /dev/null

echo
echo Install / Remove Components complete: `date`
