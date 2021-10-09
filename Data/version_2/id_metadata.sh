#A. Constantino Rodriguez
#29/04/2021

route=$(ls "$1"/*region???.gbk)

for datafile in $route
	do
	id=$(grep 'SEED:' $datafile | cut -d ':' -f 2 | cut -d '"' -f 1)
	organism=$(grep 'SOURCE' $datafile | cut -d ' ' -f 2-)
	region0=$(grep 'ACCESSION' $datafile | cut -d '0' -f 2- | cut -d '_' -f 1)
	region00=$(grep 'region_number' $datafile | cut -d '"' -f 2)
	region=$region0.$region00
	type=$(grep -w -A 6 'region' $datafile | grep 'product' - | cut -d '"' -f 2)
	file0=$(grep 'LOCUS' $datafile | cut -d ' ' -f 8)
	file1=$file0'_c'$region00'.txt'
	similar_cluster=$(grep -A 1 'Significant hits' "$1"/knownclusterblast/$file1 | tail -n 1 | cut -f 2)
	for line in $id
		do
		echo -e $line'\t'$organism'\t'$type'\t'$similar_cluster'\t'$route >> "$1"metadata.txt
	done
done
