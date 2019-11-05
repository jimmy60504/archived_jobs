#! /bin/bash
declare -i geoint=4
declare -i nearoff=144
declare -i chan=288
declare -i swap=6
declare -i fshot=132
declare -i rshot=72
format="%8s %8s %8s %8s %8s\n"
printf "$format" "Shot" "Channel" "Station" "Channel" "Station" > relation.txt  
for (( i=101; i<=$fshot+100; i++ ))
do
	S1=$(((i-101)/swap*24+nearoff/geoint+1))
	S2=$((S1+chan-1))
	printf  "$format" $i "1" $S1 $chan $S2 >> relation.txt
done
rstat=$S2
for ((i=$fshot+101; i<=$fshot+$rshot+100; i++ ))
do
	S1=$((rstat-(i-101-$fshot)/swap*24))
	S2=$((S1-chan+1))
	printf  "$format" $i "1" $S1 $chan $S2 >> relation.txt
done
