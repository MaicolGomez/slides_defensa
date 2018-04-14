APP = "offload_values"
OUTPUT_FILE = APP . '.pdf'
INPUT_FILE = APP . '.dat'

set terminal pdf enhanced size 12,6.0
set output OUTPUT_FILE
set key horizontal outside center bottom
unset border
set border 15 lw 3 # (1=bottom, 2=left,  4=top,  8=right)

set xtics font ", 17"
set ytics font ", 20"
set ylabel font ",25" offset -2
set key font ",25"

set yrange [0:100]

set lmargin 14
set bmargin 10
set rmargin 14

set bars fullwidth
set boxwidth 0.75 absolute
set style fill solid 1.0 border -1
set offset -0.6,-0.6,0,0

set ylabel "% over total time"

set xtics ("2048" 0, "4096" 1, "8192" 2, "" 3, "128" 4, "256" 5, "512" 6, "" 7, "2048" 8, "4096" 9, "8192" 10, "" 11, "2048" 12, "4096" 13, "8192" 14, "" 15, "2048" 16, "4096" 17, "8192" 18, "" 19, "2048" 20, "4096" 21, "8192" 22)


set style histogram rowstacked title offset 0,-4
set style data histogram

plot \
newhistogram "2DCONV" font ",20" lt 3, '2dconv_offload.dat' u (100.*($2/$5)) notitle lc rgb '#9400D3', "" u (100.*($3/$5)) notitle lc rgb '#F4A460', "" u (100.*($4/$5)) notitle lc rgb '#87CEEB',\
newhistogram "3DCONV" font ",20", '3dconv_offload.dat'u (100.*$2/$5) notitle lc rgb '#9400D3', "" u  (100.*($3/$5)) notitle lc rgb '#F4A460', "" u (100.*$4/$5) notitle lc rgb '#87CEEB',\
newhistogram "ATAX" font ",20", 'atax_offload.dat' u (100.*$2/$5) notitle lc rgb '#9400D3', "" u (100.*$3/$5) notitle lc rgb '#F4A460', "" u (100.*$4/$5) notitle lc rgb '#87CEEB',\
newhistogram "BICG" font ",20", 'bicg_offload.dat' u (100.*$2/$5) notitle lc rgb '#9400D3', "" u (100.*$3/$5) notitle lc rgb '#F4A460',"" u (100.*$4/$5) notitle lc rgb '#87CEEB',\
newhistogram "GESUMMV" font ",20", 'gesummv_offload.dat' u (100.*$2/$5) notitle lc rgb '#9400D3', "" u (100.*$3/$5) notitle lc rgb '#F4A460',"" u (100.*$4/$5) notitle lc rgb '#87CEEB',\
newhistogram "MVT" font ",20", 'mvt_offload.dat' u (100.*$2/$5) t "Offload" lc rgb '#9400D3',"" u (100.*$3/$5) t "OpenCL" lc rgb '#F4A460'  ,"" u (100.*$4/$5) t "Kernel" lc rgb '#87CEEB

set output
