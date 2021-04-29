#!/bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 17:00:00
#SBATCH -J 01_assembly_L.ferr_WGS
#SBATCH --mail-type=ALL
#SBATCH --mail-user maryam.dost.3945@student.uu.se

#Load modules
module load bioinfo-tools
module load htseq

#-------------------- RUN Htseq ------------------------------


 
# -f Format of the input data, here the format is in bam 
# -r Alignment have to be sorted either by read name or by alignment position. 
# -t feature 
# -i id atribute, ID instead of gene_id in GFF file 
# -s reverse due to paired-end reads, the first read has to be on the same strand and the second read on the opposite strand.
# alignemnt files from bwa 
# gff file from Anotated genome 
 
path="~/private/GenomeAnalysis/Analyses/differentialExpressionAnalyses/03_mappingBWA/"
pref = "sorted.bam"
cd ~/private/GenomeAnalysis/Analyses/differentialExpressionAnalyses/04_countingHtseq

for f in ERR2036629  ERR2036632  ERR2117289  ERR2117292 ERR2036630  ERR2036633  ERR2117290 ERR2036631  ERR2117288  ERR2117291
do
file=$path$f
htseq-count \
    -f bam \
    -r pos \
    -t CDS \
    -i ID \
    -s reverse \
    $file.sorted.bam \
    ~/private/GenomeAnalysis/Analyses/genomeAssembly/0301Annotation_ProkkaLferriphilum/Lferriphilum.gff > ${f}.txt

    echo "done" 
 done

#-------------------------------------------------
