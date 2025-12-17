#! /bin/bash --login

########## Define Resources Needed with SBATCH Lines ##########

#SBATCH --array=0               #500 array threads that will run in parallel
#SBATCH --time=3:59:00             # limit of wall clock time - how long the job will run (same as -t)
#SBATCH --nodes=1                  
#SBATCH --ntasks=1                  # number of tasks - how many tasks (nodes) that you require (same as -n)
#SBATCH --cpus-per-task=1           # number of CPUs (or cores) per task (same as -c)
#SBATCH --mem-per-cpu=3G
#SBATCH --job-name MOP1               # you can give your job a name for easier identification (same as -J)
#SBATCH --output=%x_%j.out # output (%x is the --job-name and %j is the job id); there will be 100 output files, one for each thread
########## Command Lines to Run ##########

SAMPLE=(OG0001880)
 
echo "${SLURM_ARRAY_TASK_ID} ; ${SAMPLE[${SLURM_ARRAY_TASK_ID}]}" # iterate throught the list SAMPLE (length of 500 elements)
echo ${SAMPLE[${SLURM_ARRAY_TASK_ID}]}
cd /mnt/ufs18/nodr/home/chenhua9/2025_GrassFamily_V5Updated/RdDM_pathway/RdDM_MOP1

module load SAMtools
echo "Zm"
OUTPUT=/PATH/RdDM_MOP1
DataC4=/PATH/RawdataC4
grep ">" ${SAMPLE[${SLURM_ARRAY_TASK_ID}]}.fa > temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}
echo "Zm"
grep ">Zm" temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]} | awk -F"_" '{print $1}' | sed 's/>//g' | uniq > temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_raw1
for i in `cat temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_raw1`; do grep $i ${DataC4}/Zea_mays.Zm-B73-REFERENCE-NAM-5.0.pep.all.fa; done | cut -d" " -f 4 | sort | uniq | sed 's/gene://g' > temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_1
for i in `cat temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_1`; do grep -w $i ${DataC4}/Zea_mays.Zm-B73-REFERENCE-NAM-5.0.60.gff3; done | awk '{if($3=="gene"){print}}' | awk '{print $1,$4}' | awk '{if($2 > 3000) print $1":"$2-3000"-"$2-1; else print $1":1-"$2-1}' > temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_2
for i in `cat temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_2`; do samtools faidx ${DataC4}/Zea_mays.Zm-B73-REFERENCE-NAM-5.0.dna.toplevel.fa "$i"; done > ${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_Zm_3kb_seq
paste temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_1 temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_2 > ${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_genename

echo "Oropetium" #I could not find ID like this: Oropetium_20150105_06154A 
grep ">Ot" temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]} | sed 's/>//g' > temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_1
for i in `cat temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_1`; do grep -w $i ${DataC4}/Oro_V2.1_6-20-18.gff | awk '{print $1,$4}'| sort -nk 2 | head -1 | awk '{if($2 > 3000) print $1":"$2-3000"-"$2-1; else print $1":1-"$2-1}'; done > temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_2
for i in `cat temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_2`; do samtools faidx ${DataC4}/Oropetium_V2.1_6-20-18.dna.fa "$i"; done > ${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_Ot_3kb_seq
paste temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_1 temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_2 >> ${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_genename

echo "Setaria_viridis"
grep ">TK" temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]} | sed 's/>//g' > temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_raw1
for i in `cat temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_raw1`; do grep $i ${DataC4}/Setaria_viridis.Setaria_viridis_v2.0.pep.all.fa; done | cut -d" " -f 4 | sort | uniq | sed 's/gene://g' > temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_1
for i in `cat temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_1`; do grep -w $i ${DataC4}/Setaria_viridis.Setaria_viridis_v2.0.60.gff3; done | awk '{if($3=="gene"){print}}' | awk '{print $1,$4}' | awk '{if($2 > 3000) print $1":"$2-3000"-"$2-1; else print $1":1-"$2-1}' > temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_2
for i in `cat temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_2`; do samtools faidx ${DataC4}/Setaria_viridis.Setaria_viridis_v2.0.dna.toplevel.fa "$i"; done > ${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_Sv_3kb_seq
paste temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_1 temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_2 >> ${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_genename

echo "Sorghum_bicolor"
grep -E ">EER|>EES|>KXG|>OQU" temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]} | sed 's/>//g' > temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_raw1
for i in `cat temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_raw1`; do grep $i ${DataC4}/Sorghum_bicolor.Sorghum_bicolor_NCBIv3.pep.all.fa; done | cut -d" " -f 4 | sort | uniq | sed 's/gene://g' > temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_1
for i in `cat temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_1`; do grep -w $i ${DataC4}/Sorghum_bicolor.Sorghum_bicolor_NCBIv3.60.gff3; done | awk '{if($3=="gene"){print}}' | awk '{print $1,$4}' | awk '{if($2 > 3000) print $1":"$2-3000"-"$2-1; else print $1":1-"$2-1}' > temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_2
for i in `cat temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_2`; do samtools faidx ${DataC4}/Sorghum_bicolor.Sorghum_bicolor_NCBIv3.dna.toplevel.fa "$i"; done > ${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_Sb_3kb_seq
paste temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_1 temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_2 >> ${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_genename

#C3
DataC3=/PATH/RawdataC3
echo "Oryza_sativa"
grep ">Os" temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]} | awk -F"-" '{print $1}' | sed 's/>//g' | uniq > temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_raw1
for i in `cat temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_raw1`; do grep $i ${DataC3}/Oryza_sativa.IRGSP-1.0.pep.all.fa; done | cut -d" " -f 4 | sort | uniq | sed 's/gene://g' > temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_1
for i in `cat temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_1`; do grep -w $i ${DataC3}/Oryza_sativa.IRGSP-1.0.60.gff3; done | awk '{if($3=="gene"){print}}' | awk '{print $1,$4}' | awk '{if($2 > 3000) print $1":"$2-3000"-"$2-1; else print $1":1-"$2-1}' > temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_2
for i in `cat temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_2`; do samtools faidx ${DataC3}/Oryza_sativa.IRGSP-1.0.dna.toplevel.fa "$i"; done > ${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_Os_3kb_seq
paste temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_1 temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_2 >> ${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_genename

echo "Brachypodium_distachyon"
grep -E ">KQ|>PN" temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]} | sed 's/>//g' > temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_raw1
for i in `cat temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_raw1`; do grep $i ${DataC3}/Brachypodium_distachyon.Brachypodium_distachyon_v3.0.pep.all.fa; done | cut -d" " -f 4 | sort | uniq | sed 's/gene://g' > temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_1
for i in `cat temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_1`; do grep -w $i ${DataC3}/Brachypodium_distachyon.Brachypodium_distachyon_v3.0.60.gff3; done | awk '{if($3=="gene"){print}}' | awk '{print $1,$4}' | awk '{if($2 > 3000) print $1":"$2-3000"-"$2-1; else print $1":1-"$2-1}' > temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_2
for i in `cat temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_2`; do samtools faidx ${DataC3}/Brachypodium_distachyon.Brachypodium_distachyon_v3.0.dna.toplevel.fa "$i"; done > ${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_Bd_3kb_seq
paste temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_1 temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_2 >> ${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_genename

echo "Triticum_aestivum"
grep ">Traes" temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]} | awk -F"." '{print $1}' | sed 's/>//g' | uniq > temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_raw1
for i in `cat temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_raw1`; do grep $i ${DataC3}/Triticum_aestivum.IWGSC.pep.all.fa; done | cut -d" " -f 4 | sort | uniq | sed 's/gene://g' > temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_1
for i in `cat temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_1`; do grep -w $i ${DataC3}/Triticum_aestivum.IWGSC.60.gff3; done | awk '{if($3=="gene"){print}}' | awk '{print $1,$4}' | awk '{if($2 > 3000) print $1":"$2-3000"-"$2-1; else print $1":1-"$2-1}' > temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_2
for i in `cat temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_2`; do samtools faidx ${DataC3}/Triticum_aestivum.IWGSC.dna.toplevel.fa "$i"; done > ${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_Ta_3kb_seq
paste temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_1 temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_2 >> ${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_genename

#add name
echo "add name for each seq"
sed -i 's/>/>Bd_/g' ${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_Bd_3kb_seq
sed -i 's/>/>Os_/g' ${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_Os_3kb_seq
sed -i 's/>/>Ot_/g' ${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_Ot_3kb_seq
sed -i 's/>/>Sb_/g' ${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_Sb_3kb_seq
sed -i 's/>/>Sv_/g' ${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_Sv_3kb_seq
sed -i 's/>/>Ta_/g' ${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_Ta_3kb_seq
sed -i 's/>/>Zm_/g' ${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_Zm_3kb_seq

echo "merge"
touch aaa_${SAMPLE[${SLURM_ARRAY_TASK_ID}]}
for i in ${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_*_3kb_seq; do echo $i; cat aaa_${SAMPLE[${SLURM_ARRAY_TASK_ID}]} ${i} >> ${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_3kb_seq; done
mv ${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_3kb_seq ${OUTPUT}
mv ${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_genename ${OUTPUT}
rm aaa_${SAMPLE[${SLURM_ARRAY_TASK_ID}]} ${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_??_3kb_seq temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}_? temp${SAMPLE[${SLURM_ARRAY_TASK_ID}]}
echo "Finished!!!"
