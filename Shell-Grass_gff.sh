#! /bin/bash

#Use pep.fa file to make gff file 
#Bd
grep ">" Brachypodium_distachyon.fa | awk -F" " '{print $1,$3}' | sed 's/chromosome:Brachypodium_distachyon_v3.0://g' | sed 's/supercontig:Brachypodium_distachyon_v3.0://g' | sed 's/:/\t/g' | sed 's/>//g' | awk '{print "Bd"$2"\t"$1"\t"$3"\t"$4}' > Brachypodium_distachyon_all.gff

#Os
grep ">" Oryza_sativa.fa | awk -F" " '{print $1,$3}' | sed 's/chromosome:IRGSP-1.0://g' | sed 's/>//g' | sed 's/:/\t/g' | awk '{print "Os"$2"\t"$1"\t"$3"\t"$4}' > Oryza_sativa_all.gff

#Sv
grep ">" Setaria_viridis.fa | awk -F" " '{print $1,$3}' | sed 's/chromosome:Setaria_viridis_v2.0://g' |  sed 's/:/\t/g' | sed 's/>//g' | awk '{print "Sv"$2"\t"$1"\t"$3"\t"$4}' > Setaria_viridis_all.gff

#Sb
grep ">" Sorghum_bicolor.fa | awk -F" " '{print $1,$3}' | sed 's/chromosome:Sorghum_bicolor_NCBIv3://g' | sed 's/supercontig:Sorghum_bicolor_NCBIv3://g' | sed 's/:/\t/g' | sed 's/>//g' | awk '{print "Sb"$2"\t"$1"\t"$3"\t"$4}' > Sorghum_bicolor_all.gff

#Ta
grep ">" Triticum_aestivum.fa | awk -F" " '{print $1,$3}' | sed 's/chromosome:IWGSC://g' | sed 's/:/\t/g' | sed 's/>//g' | awk '{print "Ta"$2"\t"$1"\t"$3"\t"$4}' > Triticum_aestivum_all.gff

#Zm
grep ">" Zea_mays.fa | awk -F" " '{print $1,$3}' | sed 's/chromosome:Zm-B73-REFERENCE-NAM-5.0://g' | sed 's/:/\t/g' | sed 's/>//g' | awk '{print "Zm"$2"\t"$1"\t"$3"\t"$4}' > Zea_mays_all.gff

#Ot
awk -F"\t" '{if($3~"mRNA"){print}}' Oro_V2.1_6-20-18.gff | awk -F";" '{print $1}' | sed 's/ID=//g' | sed 's/Chromosome_//g' | awk -F"\t" '{print "Ot"$1"\t"$9"\t"$4"\t"$5}' > Oropetium_thomaeum_all.gff

#Only get chr1-10
grep -E '^Bd[0-9]' Brachypodium_distachyon_all.gff > Brachypodium_distachyon.gff
grep -E '^Ot[0-9]' Oropetium_thomaeum_all.gff > Oropetium_thomaeum.gff 
grep -E '^Os[0-9]' Oryza_sativa_all.gff > Oryza_sativa.gff
grep -E '^Sv[0-9]' Setaria_viridis_all.gff > Setaria_viridis.gff
grep -E '^Sb[0-9]' Sorghum_bicolor_all.gff > Sorghum_bicolor.gff
grep -E '^Ta[0-9]' Triticum_aestivum_all.gff >  Triticum_aestivum.gff
grep -E '^Zm[0-9]' Zea_mays_all.gff > Zea_mays.gff








