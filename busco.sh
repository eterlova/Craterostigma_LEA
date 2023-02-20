#!/bin/bash
#BATCH --job-name=busco_craterostigma
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 1
#SBATCH --mem=1G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=
#SBATCH -o %x_%A.out
#SBATCH -e %x_%A.err

hostname
date

##########################################################
##              BUSCO                                   ##      
##########################################################

module load busco/4.0.2


export AUGUSTUS_CONFIG_PATH=/isg/shared/apps/augustus/3.2.3/config

busco -i ../Data/Craterostigma_vanBuren/CratGenome/CratV4.1.12-2-20.transcripts.fasta \
        -o Craterostigma_vanBuren_CratV4.1.12_2_20_busco -l /isg/shared/databases/BUSCO/odb10/lineages/viridiplantae_odb10 -m transcriptome
