#! /bin/bash
path='/mnt/6T_D/sgy_data/land_data/ET/2015/D1/'
label='D1'
echo "*JOB" > seg2.dat            
echo "*CALL   SEG2    3000    1       360     0       ">> seg2.dat
for i in {101..244}
do
	echo "FILNAM  "$i"     "$path$i".dat" >> seg2.dat
done
echo "*CALL   HDRCNT" >> seg2.dat
echo "MIN     chan    chanmin" >> seg2.dat
echo "*CALL   HDRMATH" >> seg2.dat
echo "HHSUB   chan    chanmin chan" >> seg2.dat
echo "HCADD   chan    1       chan" >> seg2.dat
echo "HCADD   ffid    0       shot" >> seg2.dat
echo "*CALL   DSOUT   OVERWRT" >> seg2.dat 
echo "LABEL   "$label >> seg2.dat 
echo "*END  " >> seg2.dat 
