#! /bin/sh
#usage: sh Step6_countTE.sh Os | sed 'N;s/\n/;/g'

cd /PATH/RdDM_3KB_sequence_TE_Blast/$1

echo "ClassII"
echo "DNA"
echo "Count DNA TIR transposons hAT (DTA)"
grep -E 'DNA/DTA|MITE/DTA' res_*blast | wc -l

echo "Count CACTA (DTC)"
grep -E 'DNA/DTC|MITE/DTC' res_*blast | wc -l

echo "Count Pif/Harbinger (DTH)"
grep -E 'DNA/DTH|MITE/DTH' res_*blast | wc -l

echo "Count Mutator (DTM)"
grep -E 'DNA/DTM|MITE/DTM' res_*blast | wc -l

echo "Count Tc1/Mariner (DTT)"
grep -E 'MITE/DTT' res_*blast | wc -l

echo "Count Helitron superfamily (DHH)"
grep -E 'DNA/Helitron|DNAnona/Helitron' res_*blast | wc -l

echo "Count DNAnona/MULE (DNM)"
grep -E 'DNAnona/MULE' res_*blast | wc -l

echo "Count DNAnona/MULEtir (DNMt)"
grep -E 'DNAnona/MULEtir' res_*blast | wc -l

echo "Count DNAnona/Tourist (DNT)"
grep -E 'DNAnona/Tourist' res_*blast | wc -l

echo "Count MITE/Stow (DMS)"
grep -E 'MITE/Stow' res_*blast | wc -l

echo "Count MITE/Tourist (DMT)"
grep -E 'MITE/Tourist' res_*blast | wc -l

echo "Count Evirus/ERTBV (DEE)"
grep -E 'MITE/ERTBV' res_*blast | wc -l


echo "ClassI"
echo "RNA"
echo "Count RNA: LTR retrotransposons Copia(RLC)"
grep -E 'LTR/Copia' res_*blast | wc -l 

echo "Count RNA: Gypsy (RLG)"
grep -E 'LTR/Gypsy' res_*blast | wc -l

echo "Count RNA: LINE/unknown (RLIu)"
grep -E 'LINE/unknown' res_*blast | wc -l

echo "Count RNA: LTR/unknown (RLTu)"
grep -E 'LTR/unknown' res_*blast | wc -l

echo "Count RNA: SINE/unknown (RSu)"
grep -E 'SINE/unknown' res_*blast | wc -l

echo "Count RNA: LTR/TRIM (RLTM)"
grep -E 'LTR/TRIM' res_*blast | wc -l



