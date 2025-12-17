#! /bin/bash

grep "Os" OG00*genename | cut -f 1 | awk -F":" '{print $2}' | sort | uniq | wc -l #Os
grep "BRADI" OG00*genename | cut -f 1 | awk -F":" '{print $2}' | sort | uniq | wc -l	#Bd
grep "Traes" OG00*genename | cut -f 1 | awk -F":" '{print $2}' | sort | uniq | wc -l	#Ta
grep "Ot_" OG00*genename | cut -f 1 | awk -F":" '{print $2}' | sort | uniq | wc -l	#Ot
grep "SEVIR" OG00*genename | cut -f 1 | awk -F":" '{print $2}' | sort | uniq | wc -l	#Sv
grep "SORBI" OG00*genename | cut -f 1 | awk -F":" '{print $2}' | sort | uniq | wc -l	#Sb
grep "Zm" OG00*genename | cut -f 1 | awk -F":" '{print $2}' | sort | uniq | wc -l	#Zm

