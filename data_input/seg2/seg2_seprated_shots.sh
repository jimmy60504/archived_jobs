#! /bin/bash
data='/mnt/6T_D/backup/Jimmy/2016Ilan/DD/1/'
flow='/home/jimmy/jobs/Ilan/DD/1/.'
label='DD1'
length='3000'
samp='1'
chan='360'
swap='0'
cd $data
echo "*JOB" > seg2.dat            
printf "%-7s %-7s %-7s %-7s %-7s %-7s\n" "*CALL" "SEG2" $length $samp $chan $swap>> seg2.dat
for file in /bin/ls *.dat
do
	printf "%-7s %-7.5s %-s\n" "FILNAM" "$file" "$data$file" >> seg2.dat
done
echo "*CALL   HDRCNT" >> seg2.dat
echo "MIN     chan    chanmin" >> seg2.dat
echo "*CALL   HDRMATH" >> seg2.dat
echo "HHSUB   chan    chanmin chan" >> seg2.dat
echo "HCADD   chan    1       chan" >> seg2.dat
echo "HCSUB   ffid    100     shot" >> seg2.dat
echo "HCMUL   shot    1000    shotchan" >> seg2.dat
echo "HHADD   chan    shotchanshotchan" >> seg2.dat
echo "*CALL   DSOUT   OVERWRT" >> seg2.dat 
echo "LABEL   "$label >> seg2.dat 
echo "*END  " >> seg2.dat
mv seg2.dat $flow 
