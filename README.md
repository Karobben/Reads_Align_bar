# Reads_Align_bar

Requsition:
biopython, numpy, matlabplot is required for python3

samtools is required for the map file

Pipeline: samtools -> map.txt -> python3 -> counts and draw the barplot

quick start:

align_map2.coffee -g BC/TpnC_family.fa -b $i -i  NM_079398.4 -o  test/NM_079398.4$A.png -c 200,20 -ms ATGAGCAGCGTCGAT,TAAATAAACGCAATG
