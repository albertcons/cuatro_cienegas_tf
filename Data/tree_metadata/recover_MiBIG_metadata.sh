#08/02/2021
#A. Constantino Rodriguez
#version 1.0

#Recover metadata for MiBIG metadata
#Usage: bash recover_MiBIG_metadata.sh input_file metadata_file

#Recover of IDs
grep BGC "$1" | cut -d '_' -f 1 > IDs.txt
grep BGC "$1" | cut -f 1 > ID.txt

grep -f IDs.txt "$2" > output.txt

#Table generation
while read A B C D E F G H
do echo $A$'\t'MiBIG$'\t'$D $E $F$'\t'$C$'\t'-$'\t'-$'\t'$B$'\t'100
done < output.txt > result.tsv

#delete unuse data
rm IDs.txt
rm output.txt
#rm ID.txt
