#!/bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 17:00:00
#SBATCH -J 01_assembly_L.ferr_WGS
#SBATCH --mail-type=ALL
#SBATCH --mail-user maryam.dost.3945@student.uu.se

#Load modules
module load bioinfo-tools
module load canu


#-------- RUN CANU ----------

# -p prefix filenames
# -d dir to run in
# -pacbio-raw specifies the data type (we have raw PacBio reads...)
# GenomeSize needs to be specified (an is taken from article table 2 )
# In the lab manual it stated to set stopOnReadQuality = false, but i was advised by the lab reacher not no change the parameter   

canu \
 -p WGS_assembly \
 -d 01_assembly_out \
 genomeSize=2.6m \
 -pacbio-raw ~/private/GenomeAnalysis/Data/rawData/DNA_raw_data/ERR2028*fastq.gz
#--------------------------------------------------
