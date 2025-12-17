#! /bin/bash
#GRMZM2G086573 is an example

awk '{if($1~"GRMZM2G086573"){print}}' ll_leaf.txt | awk '{print $2}' > Leaf_GRMZM2G086573_genelist
awk '{if($1~"GRMZM2G086573"){print}}' ll_root.txt | awk '{print $2}' > Root_GRMZM2G086573_genelist
awk '{if($1~"GRMZM2G086573"){print}}' ll_sam.txt | awk '{print $2}' > Sam_GRMZM2G086573_genelist
awk '{if($1~"GRMZM2G086573"){print}}' ll_seed.txt | awk '{print $2}' > Seed_GRMZM2G086573_genelist
