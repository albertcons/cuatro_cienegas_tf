#SEED_id_finder
#Version 1.0
#30/10/2020
#A. Constantino Rodriguez
#Look and find SEED protein IDs in a file
#Works in antiSMASH output files
#Only finds SEED IDs in BGC
#SEED ID list result are listed in result.txt file
#E
#Version 2.0
#18/11/2020
#A. Constantino Rodriguez
#Create txt files with file name, organism, cluster product, SEED ID, and original id in each column

#declare -i count
#count=$(ls -l | grep '^d' | wc -l)
#Loop for enter in each organism folder

for folder in */
    do
#Loop for enter in each individual cluster file
    for datafile in $folder*region???.gbk
        do
        #Recover organism name. New version 2.0
        organism=$(grep organism $folder/*.gbk | head -n 1 | cut -d '"' -f 2 | tr ' ' '_')
        #Recover file name. New version 2.0
        file_name=$organism-result.txt
        #Recover cluster product New version 2.0
        product=$(grep product $datafile | head -n 2 | tail -n 1 | cut -d '"' -f 2)
        #Recover SEED ID. New version 2.0
        SEED_ID=$(grep 'SEED:' $datafile | cut -d '"' -f 2 | cut -d '|' -f 2)
        #Recover Original id sequence if its the case. New version 2.0
        orig_id=$(grep 'Original ID' $datafile  | cut -d ':' -f 3)
        #Recover original file name. New version 2.0
        file=$(echo $datafile | cut -d '/' -f 2)
            #Write loop for each SEED ID. Modificate version 2.0
            for element in $SEED_ID
            do
            echo -e $file'\t'$organism'\t'$product'\t'$element'\t'$orig_id >> $file_name
            echo -e $file'\t'$organism'\t'$product'\t'$element'\t'$orig_id >> all_SEED_ID.txt
        done
    done
done
