##Aqc used as outgroup to identify WGD

for i in {Stre,Cam,Spi,Rsq,Boh,Tpa,Aal,Dni,Ath,Chi,Esy,Aar};do DupGen_finder.pl -i ./  -t $i -c Aqc -o ./;done

##Ks value higher than 3 will be removed

wget https://github.com/qiao-xin/Scripts_for_GB/blob/master/identify_Ks_peaks_by_fitting_GMM/plot_syntenic_blocks_ks_distri.py

python3 plot_syntenic_blocks_ks_distri.py Cam.wgd.pairs.filtered.kaks.forplot 3 Cam
python3 plot_syntenic_blocks_ks_distri.py Streptanthus.wgd.pairs.filtered.forplot 3 Streptanthus
python3 plot_syntenic_blocks_ks_distri.py Spi.wgd.pairs.filtered.kaks.forplot 3 Spi
python3 plot_syntenic_blocks_ks_distri.py Rsq.wgd.pairs.filter.kaks.forplot 3 Rsq
python3 plot_syntenic_blocks_ks_distri.py Boh.wgd.pairs.kaks.forplot 3 Boh
python3 plot_syntenic_blocks_ks_distri.py Tpa.wgd.pairs.filtered.kaks.forplot 2 Tpa
python3 plot_syntenic_blocks_ks_distri.py Aal.wgd.pairs.filter.kaks.forplot 2 Aal
python3 plot_syntenic_blocks_ks_distri.py Dni.wgd.pairs.filter.kaks.forplot 2 Dni
python3 plot_syntenic_blocks_ks_distri.py Ath.wgd.pairs.filtered.kaks.forplot 2 Ath
python3 plot_syntenic_blocks_ks_distri.py Chi.wgd.pairs.filtered.kaks.forplot 2 Chi
python3 plot_syntenic_blocks_ks_distri.py Esy.wgd.pairs.filtered.kaks.forplot 2 Esy
python3 plot_syntenic_blocks_ks_distri.py Aar.wgd.pairs.filter.forplot 2 Aar

##KEGG and GO

##GO-- R file
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

#KEGG-- R file
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
