# Davis_Dimensions_Sdiv_Assembly

This Github repository containts scripts and data for assembly of the _Streptanthus diversifolius_ genome.

A manuscript describing this assembly is available on [BioRxiv](https://www.biorxiv.org/content/10.1101/2024.05.20.595032v1).

## Raw Sequences and Final Assembly Files

The raw sequencing and final assemvly files can been found at NCBI with accession number PRJNA283414

The final assembly files can also be found in this repository in the [HiFi_assemblies](./HiFi_assemblies) directory.  Specifically:

[S.div_Chr_Ordered.fasta.gz](./HiFi_assemblies/S.div_Chr_Ordered.fasta.gz) Is a fasta file containing the fourteen telomere-to-telomere (T2) chromosomes.  The full assembly (with unplaced contigs) is too large for github but is available on NCBI.

[S.div_Chr_Ordered_liftoffv1.gff.gz](./HiFi_assemblies/S.div_Chr_Ordered_liftoffv1.gff.gz) Is the annotation gff for the fourteen T2T chromosomes.

[S.div_liftoffv1.gff.gz](./HiFi_assemblies/S.div_liftoffv1.gff.gz) Is the annotation gff for chromosomes and addtional contigs

[S.div_Chr_Ordered.proteins.fasta.gz](./HiFi_assemblies/S.div_Chr_Ordered.proteins.fasta.gz
) and [S.div_Chr_Ordered.transcripts.fasta.gz](./HiFi_assemblies/S.div_Chr_Ordered.transcripts.fasta.gz
) are fasta files of the predicted transcripts and proteins.

## Other Analysis Folders

[Cafe_analysis](./Cafe_analysis/) Is for the gene family expansion and contactions Analysis

[WGD_identification](./WGD_identification/) Is for Ks analysis

Within the [Hifi_assemblies](HiFi_assemblies/) Folder:

[C_amplexicaulis_S_pinnata_comparisons](HiFi_assemblies/C_amplexicaulis_S_pinnata_comparisons/) Contains homoeolog rentention/loss analysis and alluvial plots

[COGE_FracBias](HiFi_assemblies/COGE_FracBias/) Is for fractionation bias analysis.

