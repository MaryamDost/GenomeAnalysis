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
#Find all maximal unique matches (-mum) between the reference and query 
# on both the forward and reverse strands (-b) 
# -c tells it to report all the match positions relative to the forward strand .
# Output is to stdout, so we will redirect it into a file named mummer.mums. 

mummer -mum -b -c ~/private/GenomeAnalysis/Data/rawData/reference/OBMB01.fasta ~/private/GenomeAnalysis/Analyses/genomeAssembly/01_assembly_out/WGS_assembly.contigs.fasta > lferriphilum.mums

# The code above was ran on the terminial inside the directory in which i wanten the output to exist. 


# running mummerplot

# Plot all of the MUMs in the mummer.mums file in postscript format (-postscript). 
# --prefix prefix the four files with the given string. 
#mummer.gp is a gnuplot script for plotting the data points in the plot files, and mummer.ps is the postscript plot generated by the gnuplot script. 

#mummerplot --postscript --prefix=ref_qry ref_qry.mums
#gnuplot ref_qry.gp

mummerplot --postscript --prefix=lferriphilum ~/private/GenomeAnalysis/Data/rawData/reference/OBMB01.fasta lferriphilum.mums
gnuplot lferriphilum.gp

#Ran again to get png file
mummerplot \
 --prefix=lferriphilum \
 --png \
 lferriphilum.mums

#-----------------------------------------------------------------------------------------------------------
# More on how to code and run MUMer and mumplot is found in its manual which is avalible in https://mummer4.github.io/tutorial/tutorial.htmll