# Craterostigma_LEA
Notes on how I obtained and classified LEA genes from _Craterostigma_ transcriptome and genome

## Goals and order of operations
The goal of this project is to obtain nucleotide sequences of the CDS regions of _Craterostigma_ LEA genes expressed in the vegetative state. To do this the following steps are planned:

1) transcriptome annotation with EnTAP (also performs frame selection and contamination filtering)
2) selection of the LEA transcripts
3) mapping the LEA trancripts to the genome
4) verification of the completeness of the transcripts (by also mapping LEA genes from other organisms to the _Craterostigma_ genome)
5) classification of _Craterostigma_ LEA genes into groups

## Data
The assembled genomes and transcriptomes come from Van Buren et al. 2023 (the Plan Journal) and were obtrained from the authors of this paper. Both genomes and transcriptomes were assembled, whether the frame selection was performed is unclear. The transcriptome was in the form of nucleotide fasta file, the genome was in the form of translated proteins. However, the nucleotide sequences of the scaffolded genome is publically available on genomeevolution.org (ID 60082).

Data directory structure
- Craterostigma_vanBuren

-- CratGenome
--- CratV4.1.12-2-20.proteins.fasta 
--- CratV4.1.12-2-20.transcripts.fasta #not filtered by length
--- CratV4.1.all.gff
--- CratV4.1.all.maker.proteins.fasta
--- CratV4.1.GO_id2go.txt.txt

-- CratTranscriptome
--- sample_names.xlsx
--- TPM_Crat_leaf.txt
--- TPM_Crat_root.txt

-- GG-Files
--- Expression-Data_GG.xlsx
--- Expression-Data.xlsx

## Initial QC
To orient myself at what the transcriptomic data looks like, I performed two QC checks. To assess completness of the transcriptome assembly I usied the Veridiplanta BUSCO database. the other QC step, QUAST, computes transcriptome assembly stats.

### Transcriptome completeness with Busco
Busco analysis was performed with the [busco.sh script](busco.sh)
The obtained results:

        C:99.1%[S:3.3%,D:95.8%],F:0.2%,M:0.7%,n:425        
        421     Complete BUSCOs (C)                        
        14      Complete and single-copy BUSCOs (S)        
        407     Complete and duplicated BUSCOs (D)         
        1       Fragmented BUSCOs (F)                      
        3       Missing BUSCOs (M)                         
        425     Total BUSCO groups searched
        
### Transcriptome assembly stats
QUAST was used to compute basic transcriptome assembly stats using [quast.sh script](quast.sh)


        METRICS/TRANSCRIPTS                                    CratV4.1.12_2_20.transcripts  
        == BASIC TRANSCRIPTS METRICS (calculated without reference genome and gene database) == 
        Transcripts                                            230564                        
        
        Transcripts > 500 bp                                   166679                        
        Transcripts > 1000 bp                                  99941                         
        
        Average length of assembled transcripts                1091.246                      
        Longest transcript                                     17238                         
        Total length                                           251601940                     
        
        Transcript N50                                         3653     


## Transcriptome annotation with EnTAP

EnTAP pipeline was used to select reading frames and annotate _Craterostigma_ transcriptome. Running EnTAP requires the [entap_config.ini](entap_config.ini) and [entap.sh](entap.sh) files. Frame selection was performed with GeneMarkS-T, similarity search was run against RefSeq and Uniprot DIAMOND databases (70% both similarity and coverage cut-offs), Pfam protein family assignment carried out with InterProScan. 


* Hart AJ, Ginzburg S, Xu M, et al. EnTAP: Bringing faster and smarter functional annotation to non-model eukaryotic transcriptomes. Mol Ecol Resour. 2020;20:591–604. https://doi.org/10.1111/1755-0998.13106
* Paysan-Lafosse T, Blum M, Chuguransky S, Grego T, Pinto BL, Salazar GA, Bileschi ML, Bork P, Bridge A, Colwell L, Gough J, Haft DH, Letunić I, Marchler-Bauer A, Mi H, Natale DA, Orengo CA, Pandurangan AP, Rivoire C, Sigrist CJA, Sillitoe I, Thanki N, Thomas PD, Tosatto SCE, Wu CH, Bateman A. InterPro in 2022. Nucleic Acids Research, Nov 2022, (doi: 10.1093/nar/gkac993)
* diamond citation

