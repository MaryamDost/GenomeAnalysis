#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:20:00
#SBATCH -J 02_RNA_rd_qc_fastqc
#SBATCH --mail-type=ALL
#SBATCH --mail-user maryam.dost.3945@student.uu.se

# Load modules
module load bioinfo-tools
module load MUMmer/4.0.0beta2

#-b operator is used to check if the specified file is a block special file or not. 
#If the file is a block special file then the function returns true otherwise returns false.

