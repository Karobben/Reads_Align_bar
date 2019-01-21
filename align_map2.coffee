import os
import matplotlib.pyplot as plt
from matplotlib.ticker import MultipleLocator
import numpy as np
from Bio import SeqIO



## argparse
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('-g','-G','--base',help="Base fa // Trintiy.fa")
parser.add_argument('-b','-B','--bam', help="sorted and idx by samtools' bam file")
parser.add_argument('-i','-I','--NrIP',default="NR",help="Seq ID in Base file liske NM_001169584.2")
parser.add_argument('-p','-P','--position',default = 1,help="postion on the reference Seq (int),default = 1")
parser.add_argument('-e','-E','--endposition',default = 1000000,help="It's useless here")
parser.add_argument('-o','-O','--output',default = "output.pdf",help="Name of output file, exp: output.png // output.pdf, default = output.pdf")
parser.add_argument('-c','-C','--chsize',default = (200,20), help="The size of the chart, default = 200,20" )
parser.add_argument('-m','-M','--mark',default = 0 ,help="Extral mark on the chart by int posation, exp: 20,100")
parser.add_argument('-ms','-MS','--markseq',default = 0 ,help="Extral mark on the chart by special tag, exp: ATGGCCGAT,TGACCCACATTG")

#获取参数
args = parser.parse_args()
BASE = args.base
S_BAM = args.bam
Nr_IP = args.NrIP
Num_IP = args.position
End_p = args.endposition
ChSize = tuple(map(int,args.chsize.split(',')))
OUTPUT = args.output
#BASE = 'BC/TpnC_family.fa'
#S_BAM = 'sorted_1W_IFM1.bam'
#Nr_IP = 'NM_136329.3'
#Num_IP = 1

Seq1= BASE
for seq_record in SeqIO.parse(Seq1, "fasta"):
  if seq_record.id == Nr_IP:
    End_p=len(seq_record.seq)
    break

Seq_list = []
Count_list=[]
Seq = ''

while 1 ==1:
  # get the reference Seq
  CMD = "samtools tview " + S_BAM +" " +BASE +" -p '" +Nr_IP +":"+str(Num_IP)+"' -d T"
  Seq_map = os.popen(CMD).read().split('\n')[1:-1]
  Seq_tmp = Seq_map[0].replace('*','')
  Seq += Seq_tmp
  Seq_N = len(Seq_tmp)
  for i in Seq_tmp:
    Seq_list += [i]
  # get the match map
  for i in range(len(Seq_map[0])):
    if Seq_map[0][i] != "*":
      #print(Seq_map[0][i],i)
      Count_tmp = 0
      for ii in range(len(Seq_map)-1):
        iii = ii+1
        if Seq_map[iii][i] != " ":
          Count_tmp += 1
      Count_list += [Count_tmp]
  Num_IP += Seq_N
  if len(Seq) > End_p:
    break

##extral mark##
Mark_C = "0,"*End_p
Mark_C = list(map(int,Mark_C.split(',')[:-1]))
Num_C = max(Count_list)
try:
  Mark_p = list(map(int,args.mark.split(',')))
  for i in Mark_p:
    Mark_C[i]= Num_C
    Mark_C[i] = Num_C
except:
  print("No Mark posation input")

## start determine
try:
  Mark_sp = args.markseq.split(',')
  for i in Mark_sp:
    Mark_C[Seq.find(i)] = Num_C
except:
  print('no markseq input')

##Mark N
Mark_N = "0,"*End_p
Mark_N = list(map(int,Mark_N.split(',')[:-1]))
for i in range(End_p):
  if Count_list[i] == 0:
    Mark_N[i] = Num_C

f = plt.figure(figsize=ChSize)
spacing = 10
minorLocator = MultipleLocator(spacing)
X=np.arange(End_p)
plt.bar(X, Count_list[:End_p])
plt.bar(X, Mark_C,color = 'red',alpha=0.6)
plt.bar(X, Mark_N,color = 'grey',alpha=0.4)
plt.xticks(X, Seq_list[:End_p])
plt.title(S_BAM+":"+BASE.split('/')[-1]+":"+Nr_IP+":Y="+str(Num_C),size=100)
#plt.grid(True)
#plt.show()
f.savefig(OUTPUT, bbox_inches='tight')
