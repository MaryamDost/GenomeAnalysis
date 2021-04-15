#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J  2_trimmomatic
#SBATCH --mail-type=ALL
#SBATCH --mail-user maryam.dost.3945@student.uu.se


# Load modules
module load bioinfo-tools
module load trimmomatic

# Run trimmomatic in one file, to save some time
java -jar $TRIMMOMATIC_HOME/trimmomatic.jar \
PE -threads 2 -phred33 \
-basein ~/private/GenomeAnalysis/Data/rawData/ERR2036629_1.fastq.gz \
-baseout ~/private/GenomeAnalysis/Analyses/02_trimmomatic/ERR2036629_Trimmed.fastq.gz \
ILLUMINACLIP:$TRIMMOMATIC_HOME/adapters/TruSeq3-PE.fa:2:30:10 \
LEADING:20 \
TRAILING:20 \
SLIDINGWINDOW:1:3 \
MINLEN:40 \
MAXINFO:40:0.5 \