#! /bin/bash
declare -i geoint=2
declare -i nearoff=96
declare -i chan=192
declare -i swap=8
format="%8s %8s %8s %8s %8s\n"
printf "$format" "Shot" "Channel" "Station" "Channel" "Station" > relation.txt            
for i in {101..196}
do
	S1=$(((i-101)/swap*24+nearoff/geoint+1))
	S2=$((S1+chan-1))
	printf  "$format" $i "1" $S1 $chan $S2 >> relation.txt
done
