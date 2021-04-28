#!/bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:10:00
#SBATCH -J 0104_Annotation_Prokka
#SBATCH --mail-type=ALL
#SBATCH --mail-user maryam.dost.3945@student.uu.se

#load modules 
module load bioinfo-tools
module load prokka/1.12-12547ca

#--------- RUN PROKKA --------------------------------

# input fasta file 
# out dir 
# prefix for files 

prokka \
# ~/private/GenomeAnalysis/Analyses/genomeAssembly/01_assembly_out/WGS_assembly.contigs.fasta
~/private/GenomeAnalysis/Analyses/genomeAssembly/01_assembly_out/lferriphilum_genome.fasta
 --outdir 0301Annotation_Prokkalferriphilum \
 --prefix prokkaAnnotation_lferriphilum_genome
