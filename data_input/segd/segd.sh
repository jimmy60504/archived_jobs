#!/bin/bash
dir="/mnt/6T_D/backup/Jimmy/20150812_data/0905_01/TAPE50002.REEL/"
cd $dir
declare -i reelno=-1
for file in /bin/ls *.RAW
do

if [ "$reelno" -eq 1 ]; then
	echo "$reelno $dir$file" > input_file.list
elif [ "$reelno" -gt 1 ]; then
	echo "$reelno $dir$file" >> input_file.list
fi
reelno=reelno+1
done
