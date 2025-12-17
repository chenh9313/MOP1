#! /bin/sh

sort Res_total_UP | uniq > Res_total_UP_Uniq
sort Res_total_DOWN | uniq > Res_total_DOWN_Uniq

#Needed to be removed genes
cat Res_total_UP_Uniq SigDEG_413_Upregulated_removed.txt | sort | uniq -d -c
cat Res_total_DOWN_Uniq SigDEG_191_Downregulated_removed.txt | sort | uniq -d -c

#Overlapped gene number
sort Res_total_UP | uniq -d -c | sort -rnk 1
sort Res_total_UP | uniq -u

sort Res_total_DOWN | uniq -d -c | sort -rnk 1
sort Res_total_DOWN | uniq -u
