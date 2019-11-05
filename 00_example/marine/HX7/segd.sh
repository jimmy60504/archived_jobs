#!/bin/bash
dir="/mnt/6T_D/MCS/MCS_SW_Tai_Basin/SEGD/"
cd $dir
declare -i reelno=0
for file in /bin/ls *.segd
do

if [ "$reelno" -eq 1 ]; then
	echo "$reelno $dir$file" > input_file.list
elif [ "$reelno" -gt 1 ]; then
	echo "$reelno $dir$file" >> input_file.list
fi
reelno=reelno+1
done
