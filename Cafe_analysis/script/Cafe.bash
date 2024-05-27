##cafe

#remove
awk 'OFS="\t" {$NF=""; print}' Orthogroups.GeneCount.tsv > tmp && awk '{print "(null)""\t"$0}' tmp > cafe.input.tsv && sed -i '1s/(null)/Desc/g' cafe.input.tsv && rm tmp

python /DATA/home/qionghou/soft/CAFE5/tutorial/clade_and_size_filter.py -i cafe.input.tsv -o cafe.input.filter.tsv -s

/DATA/home/qionghou/soft/CAFE5/bin/cafe5 -i cafe.input.filter.tsv -t tree.txt -p -k 2 -o k2p
/DATA/home/qionghou/soft/CAFE5/bin/cafe5 -i cafe.input.filter.tsv -t tree.txt -p -k 3 -o k3p
/DATA/home/qionghou/soft/CAFE5/bin/cafe5 -i cafe.input.filter.tsv -t tree.txt -p -k 4 -o k4p
/DATA/home/qionghou/soft/CAFE5/bin/cafe5 -i cafe.input.filter.tsv -t tree.txt -p -k 5 -o k5p
cd k2p
cat Gamma_p0.05change.tab | cut -f 1,2 | awk '$2 < 0 {print $1}' > Streptanthus.significant.contract
cat Gamma_p0.05change.tab | cut -f 1,2 | awk '$2 >= 1 {print $1}' > Streptanthus.significant.expend

##GO & KEGG

##GO
library('clusterProfiler')
library(optparse)
library(GO.db)
library(ggplot2)
gene=read.csv(opt$geneList,header=F,sep="\t",comment.char = ";",na.strings = c("", "NA"))
cat('Read gene\n')
universe=read.csv(opt$uniList,header=F,sep="\t",comment.char = ";",na.strings = c("", "NA"))
cat('Read universe\n')
#print(universe)
term2gene=read.csv(opt$t2gList,header=F,sep="\t",comment.char = ";",na.strings = c("", "NA"))
goterms <- Term(GOTERM)
term2name <- data.frame("GOID"=names(goterms),"term"=goterms )
cat('Read terms\n')
#term2name=read.csv(opt$t2nList,header=F,sep="\t",comment.char = ";",na.strings = c("", "NA"))
#ewp<-enricher(gene$V1,TERM2GENE=term2gene,pvalueCutoff =1,qvalueCutoff =1,TERM2NAME =term2name)
#ewp<-enricher(gene$V1,TERM2GENE=term2gene,pvalueCutoff =1,qvalueCutoff =1,TERM2NAME =term2name,universe=universe)
ewp2<-enricher(gene$V1,TERM2GENE=term2gene,pvalueCutoff =1,qvalueCutoff =1,TERM2NAME =term2name,universe=as.character(universe$V1))
ewp<-enricher(gene$V1,TERM2GENE=term2gene,pvalueCutoff =.05,qvalueCutoff =.05,TERM2NAME =term2name,universe=as.character(universe$V1))
cat('Run enrichers\n')
write.table(ewp,paste0(opt$out,".enrichout.p0.05.xls"),sep='\t',quote = FALSE,row.names=FALSE)

#KEGG
library('clusterProfiler')
library(optparse)
library(GO.db)
library(ggplot2)
gene=read.csv(opt$geneList,header=F,sep="\t",comment.char = ";",na.strings = c("", "NA"))
universe=read.csv(opt$uniList,header=F,sep="\t",comment.char = ";",na.strings = c("", "NA"))
term2gene=read.csv(opt$t2gList,header=F,sep="\t",comment.char = ";",na.strings = c("", "NA"))
goterms <- Term(GOTERM)
term2name=read.csv(opt$t2nList,header=F,sep="\t",quote = "",row.names = NULL,stringsAsFactors = FALSE)
cat("run enricher")
ewp<-enricher(gene$V1,TERM2GENE=term2gene,pvalueCutoff =1,qvalueCutoff =1,TERM2NAME =term2name )
write.table(ewp,paste0(opt$out,".enrichout.xls"),sep='\t',quote = FALSE)
barplot(ewp,showCategory=50)
ggsave(paste0(opt$out,".barplot.pdf"))
dotplot(ewp, showCategory=50)
ggsave(paste0(opt$out,".dotplot.pdf"))