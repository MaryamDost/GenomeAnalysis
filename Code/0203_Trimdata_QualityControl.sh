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


# running FastQC
fastqc -t 2 \
-o ~/private/GenomeAnalysis/Analyses/differentialExpressionAnalyses//0202_qc_TrimData \
-d ~/private/GenomeAnalysis/Analyses/differentialExpressionAnalyses//0202_qc_TrimData \
~/private/GenomeAnalysis/Data/rawData/*.fastq.gz
