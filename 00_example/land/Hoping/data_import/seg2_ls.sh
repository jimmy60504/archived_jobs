#! /bin/bash
data='/mnt/6T_D/backup/Jimmy/HoPing2016/A/wk/'
flow='/home/jimmy/jobs/Hoping/A/.'
output='seg2_walk.dat'
label='A_walk'
length='3000'
samp='1'
chan='288'
swap='0'
cd $data
echo "*JOB" > $output            
printf "%-7s %-7s %-7s %-7s %-7s %-7s\n" "*CALL" "SEG2" $length $samp $chan $swap>> $output
for file in /bin/ls *.dat
do
	printf "%-7s %-7.5s %-s\n" "FILNAM" "$file" "$data$file" >> $output
done
echo "*CALL   HDRCNT" >> $output
echo "MIN     chan    chanmin" >> $output
echo "*CALL   HDRMATH" >> $output
echo "HHSUB   chan    chanmin chan" >> $output
echo "HCADD   chan    1       chan" >> $output
echo "HCSUB   ffid    595     ffid" >> $output
echo "HCDIV   ffid    100     shot" >> $output
echo "HCMUL   shot    1000    shotchan" >> $output
echo "HHADD   chan    shotchanshotchan" >> $output
echo "*CALL   DSOUT   OVERWRT" >> $output 
echo "LABEL   "$label >> $output 
echo "*END  " >> $output
mv $output $flow 
