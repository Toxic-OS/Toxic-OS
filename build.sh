#!/bin/bash
#
# Copyright (C) 2016, Toxic-OS AdityaUpreti <aupreti72@gmail.com>
#
# Script based on ResurrectionRemix
# This software is licensed under the terms of the GNU General Public
# License version 2, as published by the Free Software Foundation, and
# may be copied, distributed, and modified under those terms.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# Please maintain this if you use this script or any part of it
#

normal='tput sgr0'              # White
red='tput setaf 1'              # Red
green='tput setaf 2'            # Green
yellow='tput setaf 3'           # Yellow
blue='tput setaf 4'             # Blue
violet='tput setaf 5'           # Violet
cyan='tput setaf 6'             # Cyan
white='tput setaf 7'            # White
txtbld=$(tput bold)             # Bold
bldred=${txtbld}$(tput setaf 1) # Bold Red
bldgrn=${txtbld}$(tput setaf 2) # Bold Green
bldblu=${txtbld}$(tput setaf 4) # Bold Blue
bldylw=$(txtbld)$(tput setaf 3) # Bold Yellow
bldvlt=${txtbld}$(tput setaf 5) # Bold Violet
bldcya=${txtbld}$(tput setaf 6) # Bold Cyan
bldwht=${txtbld}$(tput setaf 7) # Bold White
clear
        echo -e "${bldwht}          Welcome 2 Toxic-OS   "
tput setaf 3
        sleep 1
        echo
        echo Downloading Toxic-OS Sources
        echo
	sleep 2
tput setaf 2
        repo init -u git://github.com/Toxic-OS/platform_manifest.git -b mm
        repo sync --force-sync -f --force-broken -c --no-tags
tput setaf 3
        sleep 3
        echo
        echo Setting up Build Environment...
        echo
	sleep 4
tput setaf 2
        . build/envsetup.sh
        make clean
tput setaf 3
	echo  
	if [ ! $1 ];
	then
	echo What is your device code name? If its not listed make sure u have synced ur device tree.
	tput setaf 4
	read device
	else
	device=$1
	fi
tput setaf 3
	echo -e "Toxic-OS Will start build for ${bldred} ${device}"
	echo  
	echo -e "${bldvlt}Building Toxic!"
	echo  
	sleep 5
tput setaf 2
	logfile="$device-$(date +%Y%m%d).log"
	breakfast $device && time brunch &device 2>&1 | tee $logfile
	if [ $? -eq 0 ]; then
	printf "Congrats, Build completed grab your zip at Out dir \nBuild log is at ${logfile} incase you need it\n";
	else
	printf "Build failed, check the log at ${logfile}\n";
	exit 1;
	fi
