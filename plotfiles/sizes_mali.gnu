APP = "sizes_mali"
OUTPUT_FILE = APP . '.pdf'
INPUT_FILE = APP . '.dat'

set terminal pdf enhanced size 10,6.0
set output OUTPUT_FILE
set key horizontal outside center bottom
unset border
set border 15 lw 3 # (1=bottom, 2=left,  4=top,  8=right)

set xtics font ", 26"
set ytics font ", 26"
set y2tics font ", 26"
set ylabel font ",30" offset -2
set y2label font ",30" offset 2
set key font ",36"

set yrange [0:100]
set y2range [0:2]
set grid ytics

set lmargin 14
set bmargin 14
set rmargin 14

set bars fullwidth
set boxwidth 0.75 absolute
set style fill solid 1.0 border -1
set offset -0.6,-0.6,0,0

set ylabel "% over total time"
set y2label "speed-up over sequential"

set xtics ("2048" 0, "4096" 1, "8192" 2, "" 3, "2048" 4, "4096" 5, "8192" 6, "" 7, "2048" 8, "4096" 9, "8192" 10, "" 11, "2048" 12, "4096" 13, "8192" 14)

set y2tics (0, 0.5, 1, 1.5, 2)

set style histogram rowstacked title offset 0,-4
set style data histogram

plot \
newhistogram "2DCONV" font ",28", '2dconv_mali.dat' u (100.*($4/$2)) notitle lc rgb '#F4A460', "" u (100.*($3/$2)) notitle lc rgb '#87CEEB',\
newhistogram "ATAX" font ",28", 'atax_mali.dat' u (100.*$4/$2) notitle lc rgb '#F4A460', "" u (100.*$3/$2) notitle lc rgb '#87CEEB',\
newhistogram "BICG" font ",28", 'bicg_mali.dat' u (100.*$4/$2) notitle lc rgb '#F4A460', "" u (100.*$3/$2) notitle lc rgb '#87CEEB',\
newhistogram "MVT" font ",28", 'mvt_mali.dat' u (100.*$4/$2) t "OpenCL" lc rgb '#F4A460', "" u (100.*$3/$2) t "Kernel" lc rgb '#87CEEB', \
INPUT_FILE u 1:($2) notitle with linespoints lw 3 axes x1y2

set output
