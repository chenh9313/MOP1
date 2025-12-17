#although the 2FC significant DEGs is 646, but the actually 2FC is 0.95 to match 646 genes
#so I used 0.95 to match thsi number. 
awk '{if($3>0.95){print}}' sig882_genelist.txt > 2FCsig646_genelist.txt
