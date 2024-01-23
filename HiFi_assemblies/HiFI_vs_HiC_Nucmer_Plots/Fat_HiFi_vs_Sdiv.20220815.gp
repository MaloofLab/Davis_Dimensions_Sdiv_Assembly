set terminal png tiny size 1400,1400
set output "Fat_HiFi_vs_Sdiv.20220815.png"
set xtics rotate ( \
 "ptg000014l" 1.0, \
 "ptg000009l" 26529351.0, \
 "ptg000003l" 52463664.0, \
 "ptg000010l" 78268801.0, \
 "ptg000004l" 103940614.0, \
 "ptg000012l" 129539577.0, \
 "ptg000022l" 155007316.0, \
 "ptg000001l" 179024234.0, \
 "ptg000015l" 202282821.0, \
 "ptg000013l" 224729472.0, \
 "ptg000005l" 245814675.0, \
 "ptg000008l" 265809165.0, \
 "ptg000011l" 283852371.0, \
 "ptg000007l" 293366836.0, \
 "ptg000016l" 316939023.0, \
 "ptg000027l" 318543868.0, \
 "ptg000018l" 322557600.0, \
 "ptg000002l" 324798437.0, \
 "" 345697404 \
)
set ytics ( \
 "scaffold_5" 1.0, \
 "*scaffold_3" 22067268.0, \
 "scaffold_6" 45771076.0, \
 "scaffold_13" 67548053.0, \
 "scaffold_12" 76995047.0, \
 "scaffold_4" 88364879.0, \
 "*scaffold_1" 110861484.0, \
 "*scaffold_14" 152334735.0, \
 "*scaffold_17" 156798411.0, \
 "*scaffold_11" 157819653.0, \
 "*scaffold_15" 170314956.0, \
 "scaffold_2" 173177313.0, \
 "*scaffold_16" 210502770.0, \
 "*scaffold_8" 212450900.0, \
 "*scaffold_7" 231212462.0, \
 "scaffold_9" 251172237.0, \
 "scaffold_10" 266753123.0, \
 "" 280150441 \
)
set size 1,1
set grid
unset key
set border 0
set tics scale 0
set xlabel "S. diversifolius HiFi"
set ylabel "S. diversifolius HiC"
set title "S. diversifolius (HiFi vs HiC)"
set format "%.0f"
set mouse format "%.0f"
set mouse mouseformat "[%.0f, %.0f]"
set xrange [1:345697404]
set yrange [1:280150441]
set style line 1  lt 1 lw 3 pt 6 ps 1
set style line 2  lt 3 lw 3 pt 6 ps 1
set style line 3  lt 2 lw 3 pt 6 ps 1
plot \
 "Fat_HiFi_vs_Sdiv.20220815.fplot" title "FWD" w lp ls 1, \
 "Fat_HiFi_vs_Sdiv.20220815.rplot" title "REV" w lp ls 2
