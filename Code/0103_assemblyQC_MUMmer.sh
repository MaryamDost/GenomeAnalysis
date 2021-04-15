#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:30:00
#SBATCH -J 02_RNA_rd_qc_Mummer
#SBATCH --mail-type=ALL
#SBATCH --mail-user maryam.dost.3945@student.uu.se

# Load modules
module load bioinfo-tools
module load MUMmer/3.23

# variables
INPUT="~/private/GenomeAnalysis/Analyses/genomeAssembly/01_assembly_out/WGS_assembly.contigs.fasta"
REF="~/private/GenomeAnalysis/Data/rawData/reference/OBMB01.fasta"
MUMS="~/private/GenomeAnalysis/Analyses/genomeAssembly/0202_assemblyQC_MUMmer"

# running MUMmer
mummer -mum -b -c \
$REF \ 
$INPUT \
> $MUMS/lferriphilum.mums

# running mummerplot
cd $MUMS

mummerplot \
-Q $INPUT \
-R $REF \
$MUMS/lferriphilum.mums \
--png --prefix=lferriphilum

gnuplot lferriphilum.gp

