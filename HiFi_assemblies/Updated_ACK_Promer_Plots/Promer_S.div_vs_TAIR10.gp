set terminal pdf size 6.5,6.5
set output "Promer_S.div_vs_TAIR10.pdf"
set xtics rotate ( \
 "Chr1" 1.0, \
 "Chr2" 26529351.0, \
 "Chr3" 52463664.0, \
 "Chr4" 78268801.0, \
 "Chr5" 103940614.0, \
 "Chr6" 129539577.0, \
 "Chr7" 155007316.0, \
 "Chr8" 179024234.0, \
 "Chr9" 203032557.0, \
 "Chr10" 226604744.0, \
 "Chr11" 249863331.0, \
 "Chr12" 272367227.0, \
 "Chr13" 294813878.0, \
 "Chr14" 315899081.0, \
 "" 336183238 \
)
set ytics ( \
 "Chr1" 1.0, \
 "Chr2" 30427671.0, \
 "Chr3" 50125959.0, \
 "Chr4" 73585788.0, \
 "Chr5" 92170843.0, \
 "ChrC" 119146344.0, \
 "ChrM" 119300821.0, \
 "" 119668634 \
)
set size 1,1
set grid
unset key
set border 0
set tics scale 0
set xlabel "S. diversifolius"
set ylabel "A. thaliana"
set title "S. diversifolius vs A. thaliana"
set format "%.0f"
set mouse format "%.0f"
set mouse mouseformat "[%.0f, %.0f]"
set xrange [1:336183238]
set yrange [1:119668634]
set style line 1  lt 1 lw 3 pt 6 ps 1
set style line 2  lt 3 lw 3 pt 6 ps 1
set style line 3  lt 2 lw 3 pt 6 ps 1
plot \
 "Promer_S.div_vs_TAIR10_ACK_0.gplot"  w lp pt 5 ps .3 lc rgb "grey",  \
 "Promer_S.div_vs_TAIR10_ACK_1.gplot"  title "ACK 1" w lp pt 5 ps .3 lc rgb "#A6CEE3", \
 "Promer_S.div_vs_TAIR10_ACK_2.gplot"  title "ACK 2" w lp pt 5 ps .3 lc rgb "#1F78B4", \
 "Promer_S.div_vs_TAIR10_ACK_3.gplot"  title "ACK 3" w lp pt 5 ps .3 lc rgb "#B2DF8A", \
 "Promer_S.div_vs_TAIR10_ACK_4.gplot"  title "ACK 4" w lp pt 5 ps .3 lc rgb "#33A02C", \
 "Promer_S.div_vs_TAIR10_ACK_5.gplot"  title "ACK 5" w lp pt 5 ps .3 lc rgb "#E31A1C", \
 "Promer_S.div_vs_TAIR10_ACK_6.gplot"  title "ACK 6" w lp pt 5 ps .3 lc rgb "#FF7F00", \
 "Promer_S.div_vs_TAIR10_ACK_7.gplot"  title "ACK 7" w lp pt 5 ps .3 lc rgb "#CAB2D6", \
 "Promer_S.div_vs_TAIR10_ACK_8.gplot"  title "ACK 8" w lp pt 5 ps .3 lc rgb "#6A3D9A"
