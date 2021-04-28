#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J 04__qctrimdata_fastqc
#SBATCH --mail-type=ALL
#SBATCH --mail-user maryam.dost.3945@student.uu.se

# Load modules
module load bioinfo-tools
module load FastQC

#--------running FastQC ---------- 

#-o <path> -o <output_dir> Output directory
# -d dir to run in
# <input file path>

fastqc -t 2 \
-o ~/private/GenomeAnalysis/Analyses/differentialExpressionAnalyses//0202_qc_TrimData \
-d ~/private/GenomeAnalysis/Analyses/differentialExpressionAnalyses//0202_qc_TrimData \
~/private/GenomeAnalysis/Data/rawData/RNA_trimmed_reads/*.fastq.gz

#-----------------------------------------------------------------------------------
# sbatch 0203_Trimdata_QualityControl.sh
#this script takes the complite path, thus is ranable in anywere in homedirectory in terminal.
