#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J 02_RNA_rd_qc_fastqc
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
-o ~/private/GenomeAnalysis/Analyses/differentialExpressionAnalyses/qc_RNARawData \
-d ~/private/GenomeAnalysis/Analyses/differentialExpressionAnalyses/qc_RNARawData \
~/private/GenomeAnalysis/Data/rawData/RNA_raw_data/ERR*.fastq.gz

#-----------------------------------------------------------------------------------
# sbatch 0201_RawReads_QualityControl_FastaQC
#this script takes the complite path, thus is ranable in anywere in homedirectory in terminal.
