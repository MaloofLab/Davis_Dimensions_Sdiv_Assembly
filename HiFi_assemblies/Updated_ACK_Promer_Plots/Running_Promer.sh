#!/bin/bash

# Split reference into multiple fastas
chroms=$(grep "^>" ../Reference_Files/TAIR10_chr_all.fas | sed 's/>//')
for chrom in $chroms
do
  echo ${chrom} > temp.txt

  ../Programs/seqtk/seqtk subseq \
    -l 70 \
    ../Reference_Files/TAIR10_chr_all.fas \
    temp.txt \
    > ../Reference_Files/${chrom}.fa
done

# Run promer on each reference fasta
for chrom in $chroms
do
  ../Programs/mummer-4.0.0rc1/promer \
    --maxmatch \
    --prefix S.div_vs_${chrom} \
    ../Files/S.div_Chr_Ordered.fasta \
    ../Reference_Files/${chrom}.fa
done

#### Combining results
head -n 2 S.div_vs_Chr1.delta > S.div_vs_TAIR10.delta
#Edit file to change path the full TAIR fasta file

for chrom in $chroms
do
  grep -v "PROMER" S.div_vs_${chrom}.delta |
  grep -v "exouser" >> S.div_vs_TAIR10.delta
done

# Filter delta file
../../Programs/mummer-4.0.0rc1/delta-filter \
  -i 85 \
  -l 1000 \
  S.div_vs_TAIR10.delta \
  > Filtered_S.div_vs_TAIR10.delta
#
../../Programs/mummer-4.0.0rc1//mummerplot \
  --prefix Promer_S.div_vs_TAIR10\
  --Rfile ../../Files/S.div_Chr_Ordered.fasta \
  --size large \
  --terminal png \
  Filtered_S.div_vs_TAIR10.delta
