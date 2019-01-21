# Reads_Align_bar

Requsition:
biopython, numpy, matlabplot is required for python3

samtools is required for the map file

Pipeline: samtools -> map.txt -> python3 -> counts and draw the barplot

quick start:

align_map2.py -g BC/TpnC_family.fa -b $i -i  NM_079398.4 -o  test/NM_079398.4$A.png -c 200,20 -ms ATGAGCAGCGTCGAT,TAAATAAACGCAATG

<p align="center">
  <img src="https://github.com/Karobben/Reads_Align_bar/blob/master/Example/NM_001259210.1_1W_IFM2.2.png" width="900" title="hover text">
    <img src="https://github.com/Karobben/Reads_Align_bar/blob/master/Example/NM_001300162.1_1W_IFM1.png" width="900" title="hover text">
    <img src="https://github.com/Karobben/Reads_Align_bar/blob/master/Example/NM_078895.4_1W_IFM2.png" width="900" title="hover text">
</p>

align_map2.py -g [reference base] -b [sorted bam file] -i [Seq ID]



  -g BASE, -G BASE, --base BASE
                        Base fa // Trintiy.fa
                        
  -b BAM, -B BAM, --bam BAM
                        sorted and idx by samtools' bam file
                        
  -i NRIP, -I NRIP, --NrIP NRIP
                        Seq ID in Base file liske NM_001169584.2
                        
  -p POSITION, -P POSITION, --position POSITION
                        postion on the reference Seq (int),default = 1
                        
  -e ENDPOSITION, -E ENDPOSITION, --endposition ENDPOSITION
                        It's useless here
                        
  -o OUTPUT, -O OUTPUT, --output OUTPUT
                        Name of output file, exp: output.png // output.pdf,
                        default = output.pdf
                        
  -c CHSIZE, -C CHSIZE, --chsize CHSIZE
                        The size of the chart, default = 200,20
                        
  -m MARK, -M MARK, --mark MARK
                        Extral mark on the chart by int posation, exp: 20,100

  -ms MARKSEQ, -MS MARKSEQ, --markseq MARKSEQ
                        Extral mark on the chart by special tag, exp:
                        ATGGCCGAT,TGACCCACATTG

Makr the posation with read bar:
-m mark the posation by int (int)
-ms mark hte posation by tag, exp : ATGGCCGAT,TGACCCACATTG
