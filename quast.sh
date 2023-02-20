#!/bin/bash
#SBATCH --job-name=Quast_craterostigma
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 8
#SBATCH --mem=1G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

hostname
date

##################################################
##              rnaQUAST                        ##
##################################################

module load rnaQUAST/1.5.2
module load GeneMarkS-T/5.1


rnaQUAST.py --transcripts ~/2023LEA/Data/Craterostigma_vanBuren/CratGenome/CratV4.1.12-2-20.transcripts.fasta \
        --gene_mark \
        --threads 8 \
        --output_dir Craterostigma_vanBuren_CratV4.1.12_2_20_quast_results

date 
