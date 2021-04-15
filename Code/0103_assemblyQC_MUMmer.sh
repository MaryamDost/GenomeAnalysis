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


# running MUMmer
# mummer -mum -b -c ref.fasta qry.fasta > ref_qry.mums
mummer -mum -b -c ~/private/GenomeAnalysis/Data/rawData/reference/OBMB01.fasta ~/private/GenomeAnalysis/Analyses/genomeAssembly/01_assembly_out/WGS_assembly.contigs.fasta > lferriphilum.mums
#i run the above on terminal, maybe thats why it worked, i need to give the whole path otherwise
#~/private/GenomeAnalysis/Analyses/genomeAssembly/0202_assemblyQC_MUMmer/lferriphilum.mums

# running mummerplot
#mummerplot --postscript --prefix=ref_qry ref_qry.mums
#gnuplot ref_qry.gp

mummerplot --postscript --prefix=lferriphilum ~/private/GenomeAnalysis/Data/rawData/reference/OBMB01.fasta lferriphilum.mums
gnuplot lferriphilum.gp

#Ran again to get png file
mummerplot \
 --prefix=lferriphilum \
 --png \
 lferriphilum.mums

