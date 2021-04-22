#!/bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 08:00:00
#SBATCH -J 03_mappingBWA
#SBATCH --mail-type=ALL
#SBATCH --mail-user maryam.dost.3945@student.uu.se

# Load modules
module load bioinfo-tools
module load bwa samtools


#Using this variable when running bwa mem 
TRIMREADS=~/private/GenomeAnalysis/Data/rawData/RNA_trimmed_reads
#move to the directory where i want my outputs to be.

cd ~/private/GenomeAnalysis/Analyses/differentialExpressionAnalyses/03_mappingBWA

# Run BWA indexing
#start by creating Reference Index
#bwa index -p perifix -a file.fasta
# -p index name (here lfreedb)

bwa index -p lferrdb ~/private/GenomeAnalysis/Analyses/genomeAssembly/01_assembly_out/lferriphilum_genome.fasta

# Run BWA MEM for each experiment (two files of paired reads)
# and pipe it to SAMtools which creates a bam file and sorts it

#For iteration though files

for i in ERR2036629 ERR2036630 ERR2036631 ERR2036632 ERR2036633 ERR2117288 ERR2117289 ERR2117290 ERR2117291 ERR2117292
do

#-t the Number of threads
#-S -b input is a sam file and the output should be a bam file
#sort -o: sorted in genome order by 
bwa mem -t 2 lferrdb \
$TRIMREADS${i}_P1.trim.fastq.gz $TRIMREADS${i}_P2.trim.fastq.gz |
samtools view -S -b | samtools sort -o ${i}.sorted.bam
done