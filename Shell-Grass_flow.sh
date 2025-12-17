#! /bin/bash

#Zm
grep -v "#" Zea_mays.Zm-B73-REFERENCE-NAM-5.0.60.gff3 | grep -v "chromosome" | awk '{print $1,$3,$4,$5,$9}' | awk -F";" '{print $1}' | grep "ID=CDS" | awk '{print "Zm"$1"\t"$5"\t"$3"\t"$4}' | sed 's/ID=CDS://g' > Zea_mays_all.gff
#Bd
awk -F"\t" '{if($3~"mRNA"){print}}' Brachypodium_distachyon.Brachypodium_distachyon_v3.0.60.gff3 | awk -F";" '{print $1}' | awk -F"\t" '{print "Bd"$1"\t"$9"\t"$4"\t"$5}' | sed 's/D=transcript://g' > Brachypodium_distachyon_all.gff
#Ot
awk -F"\t" '{if($3~"mRNA"){print}}' Oro_V2.1_6-20-18.gff | awk -F";" '{print $1}' | sed 's/ID=//g' | sed 's/Chromosome_//g' | awk -F"\t" '{print "Ot"$1"\t"$9"\t"$4"\t"$5}' > Oropetium_thomaeum_all.gff
#Os
awk -F"\t" '{if($3~"mRNA"){print}}' Oryza_sativa.IRGSP-1.0.60.gff3 | awk -F";" '{print $1}' | sed 's/ID=transcript://g' | awk -F"\t" '{print "Os"$1"\t"$9"\t"$4"\t"$5}' > Oryza_sativa_all.gff
grep ">" Oryza_sativa.fa | awk '{print $1}' | grep -v Os > temp
for i in `cat temp`; do grep $i Oryza_sativa.IRGSP-1.0.60.gff3 ; done | awk -F";" '{print $1}' | sed 's/ID=CDS://g' | awk -F"\t" '{print "Os"$1"\t"$9"\t"$4"\t"$5}' >> Oryza_sativa_all.gff
#Sv
awk -F"\t" '{if($3~"mRNA"){print}}' Setaria_viridis.Setaria_viridis_v2.0.60.gff3 | awk -F";" '{print $1}' | sed 's/ID=transcript://g' | awk -F"\t" '{print "Sv"$1"\t"$9"\t"$4"\t"$5}' > Setaria_viridis_all.gff
#Sb
awk -F"\t" '{if($3~"mRNA"){print}}' Sorghum_bicolor.Sorghum_bicolor_NCBIv3.60.gff3 | awk -F";" '{print $1}' | sed 's/ID=transcript://g' | awk -F"\t" '{print "Sb"$1"\t"$9"\t"$4"\t"$5}' > Sorghum_bicolor_all.gff
#Ta
awk -F"\t" '{if($3~"mRNA"){print}}' Triticum_aestivum.IWGSC.60.gff3 | awk -F";" '{print $1}' | sed 's/ID=transcript://g' | awk -F"\t" '{print "Ta"$1"\t"$9"\t"$4"\t"$5}' > Triticum_aestivum_all.gff


