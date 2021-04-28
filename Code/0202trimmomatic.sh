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

#-------------- Run trimmomatic-----------------
#We will run on one file only, to save some time
# PE running in paired end mode
# -threads 2 amount of threads that is used
# -phred33 the data is encoded with phred33
#-basein -baseout the input and output files
#ILLUMINACLIP indicates which adapters are present on the data
#LEADING, TRAILING, SLIDINGWINDOW, MINLEN and MAXINFO were set according to the setup in the paper

java -jar $TRIMMOMATIC_HOME/trimmomatic.jar \
PE -threads 2 -phred33 \
-basein ~/private/GenomeAnalysis/Data/rawData/RNA_raw_data/ERR2036629_1.fastq.gz \
-baseout ~/private/GenomeAnalysis/Analyses/differentialExpressionAnalyses/2_Trimmomatic/ERR2036629_Trimmed.fastq.gz \
ILLUMINACLIP:$TRIMMOMATIC_HOME/adapters/TruSeq3-PE.fa:2:30:10 \
LEADING:20 \
TRAILING:20 \
SLIDINGWINDOW:1:3 \
MINLEN:40 \
MAXINFO:40:0.5 \

#----------------------------------------------------
# sbatch <the path>0202trimmomatic.sh
#this script takes the complite path, thus is ranable in anywere in homedirectory in terminal.
