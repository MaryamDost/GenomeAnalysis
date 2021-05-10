#!/bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:10:00
#SBATCH -J 0104_Annotation_ProkkaLF
#SBATCH --mail-type=ALL
#SBATCH --mail-user maryam.dost.3945@student.uu.se

#load modules 
module load bioinfo-tools
module load prokka

#--------- RUN PROKKA --------------------------------

#--outdir direction to output directory 
#--prefix prefix for output files
#--locustag  how the genes will be named in the output files
# The second line specifies the species and strain used
#--gram neg this species is gramnegative
#--usegenu genus-specific BLAST databases for the annotation
#--rfam search for ncRNAs 
#--cpus amount of CPUs used

# running prokka
prokka \
~/private/GenomeAnalysis/Analyses/genomeAssembly/01_assembly_out/lferriphilum_genome.fasta \
--outdir 0301Annotation_Prokkalferriphilum --prefix Lferriphilum --locustag LFT \
--genus Leptospirillum --species ferriphilum --strain DSM_14647 --gram neg\
--usegenus --cpus 2 --rfam \
#--------------------------------------------------
# ran prokka with command sbatch 0103_AnnotationProkka.sh
