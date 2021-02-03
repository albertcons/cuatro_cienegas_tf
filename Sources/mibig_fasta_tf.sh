
#cut -f6 regulators-MIBiG |sort|uniq |while read trans; do grep $trans regulators-MIBiG ; | while read line; do BGC=$(echo $line| cut -f1 |cut -d'|' -f1); protein=$(echo $line |cut -d' ' -f1 |cut -d'|' -f7|cut -d'.' -f1); echo $BGC $protein ;grep -A1 $BGC\_$protein MiBIG_DB.faa; done >$trans.mibig

cut -f6 regulators-MIBiG |sort|uniq |while read trans; do grep $trans regulators-MIBiG >$trans.ids; done
 
for file in  *ids
do 
	echo $file;
	cat $file |while read line; 
		do 
		BGC=$(echo $line| cut -f1 |cut -d'|' -f1); 
		protein=$(echo $line |cut -d' ' -f1 |cut -d'|' -f7|cut -d'.' -f1); 
		grep -A1 $BGC\_$protein MiBIG_DB.faa; 
		done > $file.faa
done
 #2059  head PF00158.26.ids.faa

