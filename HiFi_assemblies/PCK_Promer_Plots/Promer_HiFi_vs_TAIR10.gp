set terminal png tiny size 1400,1400
set output "Promer_HiFi_vs_TAIR10.png"
set xtics rotate ( \
 "ptg000014l" 1.0, \
 "ptg000009l" 26529351.0, \
 "ptg000003l" 52463664.0, \
 "ptg000010l" 78268801.0, \
 "ptg000004l" 103940614.0, \
 "ptg000012l" 129539577.0, \
 "ptg000022l" 155007316.0, \
 "ptg000007l" 179024234.0, \
 "ptg000001l" 202596421.0, \
 "ptg000015l" 225855008.0, \
 "ptg000013l" 248301659.0, \
 "ptg000002l" 269386862.0, \
 "ptg000005l" 290285812.0, \
 "ptg000008l" 310280302.0, \
 "ptg000011l" 328323508.0, \
 "ptg000027l" 337837973.0, \
 "ptg000018l" 341851705.0, \
 "ptg000016l" 344092542.0, \
 "" 345697404 \
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
set xrange [1:345697404]
set yrange [1:119668634]
set style line 1  lt 1 lw 3 pt 6 ps 1
set style line 2  lt 3 lw 3 pt 6 ps 1
set style line 3  lt 2 lw 3 pt 6 ps 1
plot \
 "Promer_HiFi_vs_TAIR10_PCK_0.gplot"  w lp pt 5 lc rgb "black",  \
 "Promer_HiFi_vs_TAIR10_PCK_1.gplot"  title "ACK 1" w lp pt 5 ps 1 lc rgb "yellow", \
 "Promer_HiFi_vs_TAIR10_PCK_2.gplot"  title "ACK 2" w lp pt 5 ps 1 lc rgb "red", \
 "Promer_HiFi_vs_TAIR10_PCK_3.gplot"  title "ACK 3" w lp pt 5 ps 1 lc rgb "blue", \
 "Promer_HiFi_vs_TAIR10_PCK_4.gplot"  title "ACK 4" w lp pt 5 ps 1 lc rgb "violet", \
 "Promer_HiFi_vs_TAIR10_PCK_5.gplot"  title "ACK 5" w lp pt 5 ps 1 lc rgb "orange", \
 "Promer_HiFi_vs_TAIR10_PCK_6.gplot"  title "ACK 6" w lp pt 5 ps 1 lc rgb "green", \
 "Promer_HiFi_vs_TAIR10_PCK_7.gplot"  title "ACK 7" w lp pt 5 ps 1 lc rgb "cyan"

