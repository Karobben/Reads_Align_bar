# Reads_Align_bar

Requsition:
biopython, numpy, matlabplot is required for python3

samtools is required for the map file

Pipeline: samtools -> map.txt -> python3 -> counts and draw the barplot

quick start:

align_map2.coffee -g BC/TpnC_family.fa -b $i -i  NM_079398.4 -o  test/NM_079398.4$A.png -c 200,20 -ms ATGAGCAGCGTCGAT,TAAATAAACGCAATG

<p align="center">
  <img src="https://github.com/Karobben/Reads_Align_bar/blob/master/Example/NM_001259210.1_1W_IFM2.2.png" width="900" title="hover text">
    <img src="https://github.com/Karobben/Reads_Align_bar/blob/master/Example/NM_001300162.1_1W_IFM1.png" width="900" title="hover text">
    <img src="https://github.com/Karobben/Reads_Align_bar/blob/master/Example/NM_078895.4_1W_IFM2.pngg" width="900" title="hover text">
</p>
