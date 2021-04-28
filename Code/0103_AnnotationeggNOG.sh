#!/bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J 0105AnnotationeggNOG
#SBATCH --mail-type=ALL
#SBATCH --mail-user maryam.dost.3945@student.uu.se

#load modules 
module load bioinfo-tools
module load eggNOG-mapper/1.0.3

/sw/bioinfo/eggNOG-mapper/1.0.3/rackham/emapper.py \
#-i ~/private/GenomeAnalysis/Analyses/genomeAssembly/0301Annotation_Prokka/PROKKA_04162021/PROKKA_04162021.ffn \
~/private/GenomeAnalysis/Analyses/genomeAssembly/0301Annotation_ProkkaLferriphilum/Lferriphilum.ffn \
-m hmmer \
-d bact \
 #--output_dir 09_eggnog_annotate_out \
 #--output ~/private/GenomeAnalysis/Analyses/genomeAssembly/0302Annotation_eggNOG \
outdir ~/private/GenomeAnalysis/Analyses/genomeAssembly/0302Annotation_eggNOGLferriphilum \
--data_dir /crex/data/eggNOG/4.5.1/ 
