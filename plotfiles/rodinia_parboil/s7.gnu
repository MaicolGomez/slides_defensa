APP = "s7"
OUTPUT_FILE = APP . '.pdf'
INPUT_FILE = APP . '.dat'

set terminal pdf enhanced size 10,6.0
set output OUTPUT_FILE
set key top right
unset border
set border 15 lw 3 # (1=bottom, 2=left,  4=top,  8=right)

set xtics font ", 26"
set ytics font ", 26"
set ylabel font ",30"
set key font ",38"

set grid ytics

set lmargin 14
set bmargin 9

set bars fullwidth
set boxwidth 0.9 absolute
set style fill solid 1.0 border -1

#set title font ",30"
#set title "Unibench Benchmark Suite (Samsung Galaxy S7)"
set ylabel "DCO Speedup over gpuclang"

set yrange[0.95:3]

set xtics ("mri-q" 0, 'spmv' 1, 'bfs' 2, 'hotspot' 3, 'lud' 4, 'srad' 5) rotate by 45 right
set style histogram errorbars gap 1 lw 1
set style data histogram
set grid ytics lt 0 lw 1

plot INPUT_FILE u 2:3 notitle lc rgb "#87CEEB"
#, 1.0 notitle lc rgb "#9400D3"

set output
