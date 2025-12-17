#! /bin/bash

#build a conda environment
#conda create -n maize_env python=3.8
#conda activate maize_env
#pip install intermine
#conda install requests
#conda install pandas
conda activate maize_env
python test.py

#copy Up-regulated_RdDM_155hasOrth_block genename here
cat aaa | tr '\t' '\n' | grep Zm | sort | uniq > genelist
for i in `cat genelist`; do echo $i; cp teamplte.py teamplte_${i}.py ; done
for i in `cat genelist`; do echo $i; sed -i s/mytargetgene/$i/g teamplte_${i}.py; done

for i in `cat genelist`; do echo $i; python teamplte_${i}.py > res_GOTerm_${i}.txt; done




