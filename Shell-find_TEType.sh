#! /bin/bash

cd /PATH/Zm

#find sig_Gene
awk '{if($3>90){print $1}}' *.blast | sort | uniq | wc -l

for i in *.blast; do echo $i; awk '{if($3>90){print $1,$2}}' $i | sort | uniq >res_$i; done
mv res_* Res_TE
cd Res_TE

#check if it has more than these 4
grep -v -E 'DNA|MITE|LTR|LINE|SINE|Evirus' res_* 

#for ClassII DNA
grep -e "DNA" -e "MITE" res_* | sed 's/blast:/ /g' | awk '{print $2}' | sort | uniq |wc -l 

#for ClassI RNA
grep -e "LTR" -e "LINE" res_* | sed 's/blast:/ /g' | awk '{print $2}' | sort | uniq |wc -l

#gene with ClassI RNA and ClassII DNA
grep -e "DNA" -e "MITE" -e "Evirus" res_* | sed 's/blast:/ /g' | awk '{print $2}' | sort | uniq > temp_DNA
grep -e "LTR" -e "LINE" -e "SINE" res_* | sed 's/blast:/ /g' | awk '{print $2}' | sort | uniq > temp_RNA
cat temp_DNA temp_RNA | sort | uniq -d -c | cat -n

mkdir Res_TE
for i in Os Bd Ot Sb Sv Ta Zm; do echo $i; cp ../$i/Up_regulated/Res_TE/temp_DNA temp_DNA_Upregulated_${i}; cp ../$i/Up_regulated/Res_TE/temp_RNA temp_RNA_Upregulated_${i}; done

for i in Os Bd Ot Sb Sv Ta Zm; do echo $i; cp ../$i/Down_regulated/Res_TE/temp_DNA temp_DNA_Downregulated_${i}; cp ../$i/Down_regulated/Res_TE/temp_RNA temp_RNA_Downregulated_${i}; done


