#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:20:00
#SBATCH -J 02_quality_quast
#SBATCH --mail-type=ALL
#SBATCH --mail-user maryam.dost.3945@student.uu.se

# Load modules
module load bioinfo-tools
module load quast

#
# Input is the sequence file containd from the assembly and needs to be in fasta format. 
# <input file path>
#-R <path> referencer genome file
#-o <path> -o <output_dir> Output directory

#run quast
quast.py \
~/private/GenomeAnalysis/Analyses/genomeAssembly/01_assembly_out/WGS_assembly.contigs.fasta \
-R ~/private/GenomeAnalysis/Data/rawData/reference/OBMB01.fasta \
-o ~/private/GenomeAnalysis/Analyses/genomeAssembly/0201AssemblyQC_quast

# sbatch 0102_assemblyQC_quast.sh
#this script takes the complite path, thus is ranable anywere in terminal.

#-----------------------------------------------------------------------------------------------------------
# More on how to code and run QUAST is found in its manual which is avalible in http://bioinformatics.se/tools/quast/manual.html
