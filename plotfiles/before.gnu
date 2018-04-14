APP = "before"
OUTPUT_FILE = APP . '.pdf'
INPUT_FILE = APP . '.dat'

set terminal pdf enhanced size 14,10.0
set output OUTPUT_FILE
set key horizontal outside center bottom
unset border
set border 15 lw 3 # (1=bottom, 2=left,  4=top,  8=right)

set xtics font ", 26"
set ytics font ", 26"
set ylabel font ",30"
set key font ",38"

set grid ytics
set yrange [0:100]

set lmargin 14
set bmargin 13

set bars fullwidth
set boxwidth 0.75 absolute
set style fill solid 1.0 border -1
set offset -0.6,-0.6,0,0

set ylabel "% over total time"

set tics font "Helvetica,40"
set xtics ("2dconv" 0, "2mm" 1, "3dconv" 2, "3mm" 3, "atax" 4, "bicg" 5, "corr" 6, "covar" 7, "fdtd-2d" 8,"gemm" 9, "gesummv" 10, "gramschm" 11, "mvt" 12, "syr2k" 13, "syrk" 14, "mri-q" 15, "spvm" 16, "bfs" 17, "hotstop" 18, "lud" 19, "srad" 20) rotate by 45 right
set style histogram rowstacked
set style data histogram

plot INPUT_FILE u (100.*$2/$5) t "Offloading" lc rgb '#9400D3', \
"" u (100.*$3/$5) t "OpenCL" lc rgb '#F4A460', \
"" u (100.*$4/$5) t "Kernel" lc rgb '#87CEEB'

set output