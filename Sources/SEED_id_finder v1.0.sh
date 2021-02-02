#SEED_id_finder
#Version 1.0
#30/10/2020
#A. Constantino Rodriguez
#Look and find SEED protein IDs in a file
#Works in antiSMASH output file
#Only finds SEED IDs in BGC
#SEED ID list result are listed in result.txt file
for folder in */
do
for datafile in $folder*region???.gbk
do
grep "SEED:" $datafile | cut -d "|" -f 2 >> $folder/result.txt
done
perl -p -i -e 's/\"//' $folder/result.txt
done
