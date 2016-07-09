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

start=$(date +'%s')

     echo -e "${bldred}       _______        _         ____   _____  "
        echo -e "${bldred}   |__   __|      (_)       / __ \ / ____| "
        echo -e "${bldred}      | | _____  ___  ___  | |  | | (___   "
        echo -e "${bldred}      | |/ _ \ \/ / |/ __| | |  | |\___ \  "
        echo -e "${bldred}      | | (_) >  <| | (__  | |__| |____) | "
        echo -e "${bldred}      |_|\___/_/\_\_|\___|  \____/|_____/  "
        echo -e "${bldcya}                                           "
        echo -e "${bldcya}            Building Toxic OS       "
tput setaf 3
    sleep 1
    echo
    echo Setting up Build Environment...
    echo
	sleep 2
tput setaf 2
	source build/envsetup.sh
tput setaf 3
	echo  
	if [ ! $1 ];
	then
	echo What is your device code name?
	tput setaf 4
	read device
	else
	device=$1
	fi
tput setaf 3
	echo -e "You have chosen to build Toxic OS for ${bldred} ${device}"
	echo  
	echo -e "${bldvlt}Building ToxicOS now! for $device"
	echo  
	sleep 3
tput setaf 2
	logfile="$device-$(date +%Y%m%d).log"
	lunch toxic_$device-userdebug && mka bacon 2>&1 | tee $logfile
	if [ $? -eq 0 ]; then
	printf "Build Suceeded, grab your zip at Out dir \nBuild log is at ${logfile} incase you need it\n";
	else
	printf "Build failed, check the log at ${logfile}\n";
	exit 1;
	fi
