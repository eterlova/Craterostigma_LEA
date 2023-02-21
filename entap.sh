#!/bin/bash
#SBATCH --job-name=entap_GeneMarkS-T_InteProScan
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=END
#SBATCH --mem=30G
#SBATCH --mail-user=
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

hostname
echo -e "\nStart time:"
date

module load EnTAP/0.10.8
module load perl/5.30.1
module load interproscan/5.54-87.0
module load TransDecoder/5.3.0
module load python/3.6.3
module load eggnog-mapper/0.99.1
module load diamond/2.0.9

#EnTAP --runP --ini ~/2023LEA/02_EnTAP/entap_config.ini -i /isg/shared/apps/EnTAP/0.10.8/EnTAP/test_data/trinity.fnn \
#      --database /isg/shared/databases/Diamond/RefSeq/complete.protein.faa.212.dmnd -t 8 --out-dir ~/2023LEA/02_EnTAP
 
EnTAP --runP --ini ~/2023LEA/02_EnTAP/entap_config.ini -i ../Data/Craterostigma_vanBuren/CratGenome/CratV4.1.12-2-20.transcripts.fasta \
      --database /isg/shared/databases/Diamond/RefSeq/complete.protein.faa.212.dmnd \
      --database /isg/shared/databases/Diamond/Uniprot/uniprot_sprot.dmnd \
      -t 8 --out-dir ~/2023LEA/02_EnTAP



echo -e "\nEnd time:"
date
