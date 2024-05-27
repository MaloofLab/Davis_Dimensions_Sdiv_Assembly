##Orthogroups codon alignment
for i in *cds;do prefix=${i%%.cds}; echo "/DATA/home/qionghou/soft/omm_macse_v12.01.sif --in_seq_file $i --out_file_prefix $prefix --out_dir $prefix --alignAA_soft MAFFT --java_mem 50000m --debug" > omm_macse.cmd;done

## testing evolutionary hypothesis using codeml (from the PAML package)
gwidecodeml -model BS -work_dir . -cds .fna -tree single_copy_og_iqtree.OG118_spe14.unrooted.tree -dnds -branch branch_label.csv -p 50
